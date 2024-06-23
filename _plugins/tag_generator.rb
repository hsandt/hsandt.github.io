# adapted from https://www.untangled.dev/2020/06/02/tag-management-jekyll/
# Changelog:
# - replaced '_tags' with 'tags' following user comments so 'tags/[tag]' URL routing works properly
# - added FileUtils.mkdir_p to create 'tags' and 'feeds' directory if needed (i.e. the first time)

Jekyll::Hooks.register :posts, :post_write do |post|
    FileUtils.mkdir_p 'tags'
    FileUtils.mkdir_p 'feeds'

    all_existing_tags = Dir.entries("tags")
    .map { |t| t.match(/(.*).md/) }
    .compact.map { |m| m[1] }

    tags = post['tags'].reject { |t| t.empty? }
    tags.each do |tag|
    generate_tag_file(tag) if !all_existing_tags.include?(tag)
    end
end

def generate_tag_file(tag)
    # generate tag file
    File.open("tags/#{tag}.md", "wb") do |file|
    file << "---\nlayout: tags\ntag-name: #{tag}\ntitle: Blog\n---\n"
    end
    # generate feed file
    File.open("feeds/#{tag}.xml", "wb") do |file|
    file << "---\nlayout: feed\ntag-name: #{tag}\n---\n"
    end
end
