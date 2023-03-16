sub init()
  m.top.functionName = "importData"
end sub
  
function importData()
  request = CreateObject("roUrlTransfer")
  request.SetCertificatesFile("common:/certs/ca-bundle.crt")
  request.AddHeader("X-Roku-Reserved-Dev-Id", "")
  request.InitClientCertificates()
  request.SetUrl("https://cdn-media.brightline.tv/recruiting/roku/testapi.json")
  responseApi = ParseJson(request.GetToString()) 

  createMoviesDataApi(responseApi)
end function

sub createMoviesDataApi(responseApi as object)
  videosInfo = responseApi.categories[0].videos
  contentData = CreateObject("RoSGNode","ContentNode")

  for i = 0 to videosInfo.Count() - 1
    videoInfo = videosInfo[i]
    itemContent = contentData.createChild("ContentNode")

    itemContent.title = videoInfo.title
    itemContent.secondaryTitle = videoInfo.subtitle
    itemContent.HDPOSTERURL = videoInfo.thumb
    itemContent.description = videoInfo.description
    itemContent.addField("urlVideo", "string", false) 
    itemContent.setField("urlVideo", false)
    itemContent.urlVideo = videoInfo.sources
  end for
  
  m.top.output = contentData
end sub

