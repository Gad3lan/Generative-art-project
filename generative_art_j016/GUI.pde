void setupGUI() {
  color activeColor = color(0, 130, 164);
  controlP5 = new ControlP5(this);
  //controlP5.setAutoDraw(false);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorCaptionLabel(color(50));
  controlP5.setColorValueLabel(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu", 15, 25, 35);
  ctrl.activateEvent(true);
  ctrl.setColorLabel(color(255));
  ctrl.close();


  sliders = new Slider[30];
  ranges = new Range[30];
  toggles = new Toggle[30];
  bangs = new Bang[30];

  int left = 0;
  int top = 5;
  int len = 300;

  int si = 0;
  int ri = 0;
  int ti = 0;
  int bi = 0;
  int posY = 0;

  sliders[si++] = controlP5.addSlider("pointCount", 1, 8000, left, top+posY, len, 15);
  posY += 30;

  sliders[si++] = controlP5.addSlider("freqX", 1, 50, left, top+posY, len, 15);
  sliders[si++] = controlP5.addSlider("freqY", 1, 50, left, top+posY+20, len, 15);
  sliders[si++] = controlP5.addSlider("phi", 0, 360, left, top+posY+40, len, 15);
  posY += 70;

  sliders[si++] = controlP5.addSlider("modFreqX", 0, 50, left, top+posY, len, 15);
  sliders[si++] = controlP5.addSlider("modFreqY", 0, 50, left, top+posY+20, len, 15);
  posY += 50;

  sliders[si++] = controlP5.addSlider("modFreq2X", 0, 50, left, top+posY, len, 15);
  sliders[si++] = controlP5.addSlider("modFreq2Y", 0, 50, left, top+posY+20, len, 15);
  sliders[si++] = controlP5.addSlider("modFreq2Strength", 0, 1, left, top+posY+40, len, 15);
  posY += 70;

  sliders[si++] = controlP5.addSlider("randomOffset", 0, 50, left, top+posY, len, 15);
  posY += 30;

  toggles[ti] = controlP5.addToggle("invertBackground", invertBackground, left+0, top+posY, 15, 15);
  toggles[ti++].setLabel("Invert Background");
  sliders[si++] = controlP5.addSlider("lineWeight", 1, 50, left, top+posY+20, len, 15);
  sliders[si++] = controlP5.addSlider("lineAlpha", 0, 100, left, top+posY+40, len, 15);
  posY += 70;

  ranges[ri++] = controlP5.addRange("hueRange", 0, 720, minHueValue, maxHueValue, left, top+posY+0, len, 15);
  sliders[si++] = controlP5.addSlider("saturationValue", 0, 100, left, top+posY+20, len, 15);
  sliders[si++] = controlP5.addSlider("brightnessValue", 0, 100, left, top+posY+40, len, 15);
  toggles[ti] = controlP5.addToggle("invertHue", invertHue, left+0, top+posY+60, 15, 15);
  toggles[ti++].setLabel("Invert Hue Range");
  posY += 90;

  sliders[si++] = controlP5.addSlider("connectionRadius", 1, 500, left, top+posY+0, len, 15);
  //sliders[si++] = controlP5.addSlider("connectionRamp",1,20,left,top+posY+20,len,15);
  posY += 20;

  toggles[ti] = controlP5.addToggle("connectAllPoints", connectAllPoints, left+0, top+posY, 15, 15);
  toggles[ti++].setLabel("Connect All Points");


  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].getCaptionLabel().toUpperCase(true);
    sliders[i].getCaptionLabel().getStyle().padding(4,3,3,3);
    sliders[i].getCaptionLabel().getStyle().marginTop = -4;
    sliders[i].getCaptionLabel().getStyle().marginLeft = 0;
    sliders[i].getCaptionLabel().getStyle().marginRight = -14;
    sliders[i].getCaptionLabel().setColorBackground(0x99ffffff);
  }
  for (int i = 0; i < ri; i++) {
    ranges[i].setGroup(ctrl);
    ranges[i].getCaptionLabel().toUpperCase(true);
    ranges[i].getCaptionLabel().getStyle().padding(4,3,3,3);
    ranges[i].getCaptionLabel().getStyle().marginTop = -4;
    ranges[i].getCaptionLabel().setColorBackground(0x99ffffff);
  }
  for (int i = 0; i < ti; i++) {
    toggles[i].setGroup(ctrl);
    toggles[i].setColorCaptionLabel(color(50));
    toggles[i].getCaptionLabel().getStyle().padding(4, 3, 1, 3);
    toggles[i].getCaptionLabel().getStyle().marginTop = -19;
    toggles[i].getCaptionLabel().getStyle().marginLeft = 18;
    toggles[i].getCaptionLabel().getStyle().marginRight = 5;
    toggles[i].getCaptionLabel().setColorBackground(0x99ffffff);
  }
  for (int i = 0; i < bi; i++) {
    bangs[i].setGroup(ctrl);
    bangs[i].setColorCaptionLabel(color(50));
    bangs[i].getCaptionLabel().getStyle().padding(4, 3, 1, 3);
    bangs[i].getCaptionLabel().getStyle().marginTop = -19;
    bangs[i].getCaptionLabel().getStyle().marginLeft = 48;
    bangs[i].getCaptionLabel().getStyle().marginRight = 5;
    bangs[i].getCaptionLabel().setColorBackground(0x99ffffff);
  }
}



void drawGUI() {
  controlP5.show();
  controlP5.draw();
}



void controlEvent(ControlEvent theControlEvent) {
  guiEvent = true;

  GUI = controlP5.getGroup("menu").isOpen();

  if (theControlEvent.isController()) {
    if (theControlEvent.getController().getName().equals("hueRange")) {
      float[] f = theControlEvent.getController().getArrayValue();
      minHueValue = f[0];
      maxHueValue = f[1];
    }
  }
}

void invertBackground() {
  guiEvent = true;
  invertBackground = !invertBackground;
  updateColors(invertBackground);
}



void updateColors(boolean stat) {
  ControllerGroup ctrl = controlP5.getGroup("menu");

  for (int i = 0; i < sliders.length; i++) {
    if (sliders[i] == null) break;
    if (stat == false) {
      sliders[i].setColorCaptionLabel(color(50));
      sliders[i].getCaptionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      sliders[i].setColorCaptionLabel(color(200));
      sliders[i].getCaptionLabel().setColorBackground(0x99000000);
    }
  }
  for (int i = 0; i < ranges.length; i++) {
    if (ranges[i] == null) break;
    if (stat == false) {
      ranges[i].setColorCaptionLabel(color(50));
      ranges[i].getCaptionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      ranges[i].setColorCaptionLabel(color(200));
      ranges[i].getCaptionLabel().setColorBackground(0x99000000);
    }
  }
  for (int i = 0; i < toggles.length; i++) {
    if (toggles[i] == null) break;
    if (stat == false) {
      toggles[i].setColorCaptionLabel(color(50));
      toggles[i].getCaptionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      toggles[i].setColorCaptionLabel(color(200));
      toggles[i].getCaptionLabel().setColorBackground(0x99000000);
    }
  }
  for (int i = 0; i < bangs.length; i++) {
    if (bangs[i] == null) break;
    if (stat == false) {
      bangs[i].setColorCaptionLabel(color(50));
      bangs[i].getCaptionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      bangs[i].setColorCaptionLabel(color(200));
      bangs[i].getCaptionLabel().setColorBackground(0x99000000);
    }
  }
}
