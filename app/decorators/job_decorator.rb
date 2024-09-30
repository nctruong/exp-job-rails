class JobDecorator < Draper::Decorator
  delegate_all

  delegate :percent_jobs_higher_in_maximum, :percent_jobs_higher_in_minimum, to: :salary_checker

  attr_accessor :similar, :friends

  def cached_location
    Rails.cache.fetch([cache_key, employer, __method__], expires_in: 1.weeks) do
      location
    end
  end

  def cities
    [city, second_city].select(&:present?)
  end

  def second_city_or_district
    [second_city, district].detect(&:present?)
  end

  def district
    cached_location&.district
  end

  def location_address
    location&.full_address
  end

  def second_location_address
    second_location&.full_address
  end

  def google_map_url(location)
    return nil if location.nil?
    "https://www.google.com/maps?q=#{location.full_address}"
  end

  def created_at
    job.created_at.to_date.strftime("%b %d")
  end

  def expired_time
    job.expired_at ? job.expired_at.to_time : (job.created_at + Job::EXPIRED_TIME.days).to_time
  end

  # Public: Returns similar jobs to this job with cached
  def similar
    @similar ||= fetch_similar
  end

  # Public: Returns all jobs belong to the same employer with this job (cached).
  def friends
    @friends ||= fetch_friends
  end

  def type
    Credit::CREDIT_TYPES.invert[credit_type].to_s.titleize
  end

  def date_published
    job.published_at.to_date if job.published_at
  end

  def remaining_credits
    employer.remaining_credits(job.credit_type)
  end

  def formatted_salary
    'salary'
  end

  def benefits
    [benefit_1, benefit_2, benefit_3].reject { |benefit| benefit.blank? }
  end

  def item_job_css_class
    job_class = ''
    job_class += 'job--expired ' if self.expired?
    job_class += 'super-hot-job' if self.super_hot? || gemini_low?
    job_class
  end

  def should_show_hot_label?
    hot_or_higher? && published_or_reposted_recently?
  end

  def label(local_assigns = {})
    if expired?
      render_expired_label
    elsif local_assigns.fetch(:is_saved, false)
      render_saved_label
    elsif local_assigns.fetch(:newest, false)
      render_newest_for_you_label
    elsif should_show_hot_label?
      render_hot_label
    elsif just_published?
      render_new_label
    else
      ''
    end
  end

  def render_remaining_days
    "#{render_extra_remaining_days}#{expires_in}"
  end

  def title_to_human
    title.strip
  end

  def rare_skill_tags
    skill_tags_stat  = JobApplication.skills_stats(top_count: 10, order: 'asc').keys
    job.skill_tags.select{|skill_tag| skill_tags_stat.include?(skill_tag.id)}
  end

  def top_reasons_to_join
    [benefit_1, benefit_2, benefit_3].reject(&:blank?).map do |reason|
      reason = reason.strip
      reason << '.' unless reason.last == '.'
    end
  end

  def remove_disallowed_contact
    Job::DisallowedContact.new(job).remove
  end

  def tag_id
    "job_#{id}" unless trial? || expired?
  end

  def ai_match_stats
    Jobs::GeminiStats.new(object).all if used_gemini?
  end

  def auto_accepted_candidates
    job.job_candidates.accepted.joins(:event_tracks)
  end

  def total_potential_candidates
    CandidatePool::List.call(self).count
  end

  def credit_type_to_human
    I18n.t(credit_type_in_raw, scope: :credit_type)
  end

  private

  # Public: Returns similar jobs to this job without cached
  def fetch_similar
    query = skill_tags.to_a.compact.map(&:name).join('-')
    Job.elasticsearch(query: query, per_page: 5).to_a - [object]
  end

  # Public: Returns all jobs belong to the same employer with this job (no cached).
  def fetch_friends
    employer.jobs.online.prioritized.recent - [object]
  end

  def hot_or_higher?
    hot? || super_hot? || gemini_low?
  end

  def published_or_reposted_recently?
    reposted_within?(5.days) || published_at > 15.days.ago
  end

  def reposted_within?(duration)
    reposted_at.present? && reposted_at > duration.ago
  end

  def render_expired_label
    helpers.content_tag :div, I18n.t('job.expired'), class: 'expired-text'
  end

  def render_saved_label
    helpers.content_tag :span, class: 'text nowrap' do
      (I18n.t('job.expire_in') + ' ' +
        helpers.content_tag(:span,
                            expires_in,
                            class: expired_class(days: expires_in)) + ' ' +
        I18n.t('job.days')).html_safe
    end
  end

  def render_new_label
    helpers.content_tag :div, I18n.t('job.new'), class: 'posted_date new'
  end

  def render_hot_label
    helpers.content_tag :div,
                        I18n.t('job.hot'),
                        class: 'feature new text'
  end

  def render_newest_for_you_label
    helpers.content_tag :div, 'New for You', class: 'new-for-you new'
  end

  def just_published?
    Time.current - published_at <= JUST_PUBLISHED_DURATION
  end

  def render_extra_remaining_days
    return '' if expired_at.blank?

    helpers.content_tag(:span, class: 'nowrap') do
      l(expired_at, format: :medium)
    end + helpers.tag(:br)
  end

  def salary_checker
    ::Jobs::CheckSalaryRange.new(object)
  end
end
