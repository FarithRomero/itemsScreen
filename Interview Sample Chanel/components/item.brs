sub init()
    m.titleMovieItemLabel = m.top.findNode("titleMovieItemLabel")
    m.subtitleItemLabel= m.top.findNode("subtitleItemLabel")
    m.descriptionMovieLabel = m.top.findNode("descriptionMovieLabel")

    m.titleMovieItemLabel.font.size = 22
    m.subtitleItemLabel.font.size = 16 
    m.descriptionMovieLabel.font.size = 19
end sub

sub onContentChanged()
    m.top.moviePoster = m.top.content.HDPOSTERURL
    m.top.subtitleItemLabel = m.top.content.SECONDARYTITLE
    m.top.titleMovieItemLabel = m.top.content.TITLE
    m.top.descriptionMovieLabel = m.top.content.DESCRIPTION
    m.top.urlVideo = m.top.content.urlVideo
end sub
