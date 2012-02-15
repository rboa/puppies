module PuppiesHelper
  def create_heroes(marines)
    tmp = ""
    marines.each_with_index do |marine, index|
      tmp += link_to marine do
        selected = index == 0
        options = { id: "hero#{index}",
                    :class => "wide shadowed hero#{' hidden' if !selected}",
                    style: "background-image: url(\'" + image_path("#{marine.name}-large.jpg") + "\')" }
        content_tag :section, options do
          content_tag(:div, '', :class => "bubble_hook selected#{index}")  +
          (content_tag :div do
              content_tag(:header, marine.major, class: :ellipsis) +
              content_tag(:p, marine.minor, {:class => :multiline, style: "height: auto;"})
          end)
        end
      end
    end
    tmp.html_safe
  end
=begin


<a href="/magazines/4f2ab31fce7622059000000c/collections/4f2ab31fce7622059000001d">
  <section id="hero0" class="wide shadowed hero " style="background-image: url("/assets/issue/ces/hero_large_yoga.jpg"); display: block;">
    <div class="bubble_hook selected0"></div>
    <div>
      <header class="ellipsis">New Year, New You</header>
      <p class="multiline" style="height: auto;">Apps to help make 2012 great.</p>
    </div>
  </section>
</a>
=end

  def create_marines(marines)
    content_tag :section, :class => :wide do
      tmp = ""
      marines.each_with_index do |marine, index|
        selected = index == 0
        options = { id: "collection-#{index}",
                    :class => "collection#{' thin shadowed' if selected}",
                    style: "background-image: url(\'" + image_path("#{marine.name}-icon.jpg") + "\')" }
        tmp += content_tag :section, "", options
      end
      tmp.html_safe
    end
  end

  def create_heroes_and_marines(marines)
    create_heroes(marines) + create_marines(marines)
  end
end

=begin
<section class="wide">
<section id="collection-0" class="collection thin shadowed" style="background-image: url('/assets/issue/ces/hero_icon_yoga.png')"></section>
<section id="collection-1" class="collection" style="background-image: url('/assets/issue/ces/hero_icon_football.png')"></section>
<section id="collection-2" class="collection" style="background-image: url('/assets/issue/ces/hero_icon_mountain.png')"></section>
</section>

=end
