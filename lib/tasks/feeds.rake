namespace :feeds do
  desc "fetch feeds data"
  task :fetch => :environment do
    Feedzirra::Feed.add_common_feed_entry_element('media:content', :as => :content, :value => :url)

    Podcast.all.each do |podcast|
      puts "Fetching data for #{podcast.name}"

      entries_for(podcast.feed_url).each do |entry|
        episode = find_or_create_episode(podcast, entry)
        if episode.changed?
          puts "Retrieved changed or new episode: #{episode.name}"
          podcast.episodes << episode
        end
      end

      podcast.save
    end
  end

  def entries_for(feed_url)
    Feedzirra::Feed.fetch_and_parse(feed_url).entries
  end

  def find_or_create_episode(podcast, entry)
    podcast.episodes.find_or_initialize_by_entry_id(entry.entry_id) do |e|
      e.url = entry.url
      e.audio_url = entry.content
      e.description = entry.summary
      e.name = entry.title
      e.published_at = entry.published
    end
  end
end
