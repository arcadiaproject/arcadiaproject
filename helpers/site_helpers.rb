module SiteHelpers

  def page_title
    title = "A network of nerds, geeks beasts and cool people to know"
    if data.page.title
      title << " | " + data.page.title
    end
    title
  end
  
  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "You hacker, whatever beast you look like — designerd, developeneur, investivist, bootstrapper, a foundreamer —
you are an Arcadian."
    end
    description
  end

end