import 'dart:html';
main() {
  loadEverything();
}

void loadEverything() {
  String img = "images/egg3.png";
  ImageElement imageObj = new ImageElement();
  imageObj.onLoad.listen((Event e) {
    //  context.drawImage(imageObj, 69, 50); //i don't want to draw it. i could put it in image staging?
    addImageTagLoading(img);
    drawEverything(img);
  });

  imageObj.onError.listen((Event e){
    print("Error loading image: " + imageObj.src);
    //alert(this.src);
  });
  imageObj.src = img;


}

void addImageTagLoading(url){
  if(querySelector("#${escapeId(url)}") == null) {
    String tag = '<img id="' + escapeId(url) + '" src = $url class="loadedimg">';
    querySelector("#loading_image_staging").appendHtml(tag,treeSanitizer: NodeTreeSanitizer.trusted);
  }
}

String escapeId(String toEscape) {
  return toEscape.replaceAll(new RegExp(r"\.|\/"),"_");
}


void drawEverything(String imageString) {
  String canvasHTML = "<br><canvas id='canvas' width='1000' height='400'>  </canvas>";
  querySelector("#story").appendHtml(canvasHTML,treeSanitizer: NodeTreeSanitizer.trusted);
  CanvasElement canvas = querySelector("#canvas");
  CanvasRenderingContext2D ctx = canvas.getContext('2d');
  ImageElement img = querySelector("#${escapeId(imageString)}");
  if(img == null) {
    print("img was null!");
    print("was looking for ${escapeId(imageString)}");
  }
  ctx.drawImage(img, 0, 0);

}