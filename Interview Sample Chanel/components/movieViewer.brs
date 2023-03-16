sub init()
    m.top.setFocus(true)
    m.video = m.top.findNode("video")
    m.video.getChild(1).getChild(4).getChild(0).translation=[-475,-100]
end sub

sub onVideoUrlChange()
    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.url = m.top.videoUrl
    videoContent.streamformat = "mp4"

    m.video = m.top.findNode("video")
    m.video.content = videoContent
    m.video.control = "play" 
end sub
  