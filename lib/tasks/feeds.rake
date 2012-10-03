namespace :feeds do
  desc "fetch feeds data"
  task :fetch => :environment do
    Feedzirra::Feed.add_common_feed_entry_element('media:content', :as => :content, :value => :url)

    Podcast.all.each do |podcast|
      Feedzirra::Feed.fetch_and_parse(podcast.feed_url).entries.each do |entry|

        episode = podcast.episodes.find_or_initialize_by_entry_id(entry.entry_id) do |e|
          e.audio_url = entry.content
          e.description = entry.summary
          e.name = entry.title
          e.published_at = entry.published
        end

        podcast.episodes << episode
      end

      podcast.save
    end
  end
end
