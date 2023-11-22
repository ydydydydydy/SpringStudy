function _defineProperty(obj, key, value) {if (key in obj) {Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true });} else {obj[key] = value;}return obj;}import * as THREE from "https://cdn.skypack.dev/three@0.124.0";
import { OrbitControls } from "https://cdn.skypack.dev/three@0.124.0/examples/jsm/controls/OrbitControls";
import threeOrbitControls from "https://cdn.skypack.dev/three-orbit-controls@82.1.0";
import Gui from "https://cdn.skypack.dev/@malven/gui@1.4.1";

window.APP = window.APP || {};
window.APP.gui = new Gui();

class ThreeText {
  constructor(
  options = {
    appContainerSelector: "[data-app-container]" })

  {_defineProperty(this, "init",



    async () => {
      this.createGui();
      await this.loadTexture();
      this.createUniforms();
      this.createApp();

      // Load font
      const fontLoader = new THREE.FontLoader();
      fontLoader.load(
      "https://assets.codepen.io/66496/noe-display-medium.json",
      loadedFont => {
        this.font = loadedFont;

        this.createItems();
        this.addEventListeners();
        this.update();
      });

    });_defineProperty(this, "createGui",

    () => {
      if (!window.APP.gui) return;

      const folder = window.APP.gui.setFolder("ThreeExample");

      window.APP.gui.add(this.settings, "mouseEase", 0.01, 0.3);
      window.APP.gui.add(this.settings, "blobMinScale", 0.1, 1);
      window.APP.gui.add(this.settings, "blobMaxScale", 0.5, 5);
      window.APP.gui.add(this.settings, "blobScaleEase", 0.001, 0.5);
      window.APP.gui.add(this.settings, "blobInflate", 0.001, 0.1);
      window.APP.gui.add(this.settings, "blobDeflate", 0.001, 0.1);
    });_defineProperty(this, "loadTexture",

    async () => {
      this.imageTexture = await new THREE.TextureLoader().load(
      "https://assets.codepen.io/66496/temple-ranch-hero.jpg");

    });_defineProperty(this, "createUniforms",

    () => {
      this.uniforms = {
        imageTexture: { value: this.imageTexture } };

      this.updateUniforms();
    });_defineProperty(this, "updateUniforms",

    () => {
      Object.assign(
      this.uniforms,
      {},
      {
        iter: { value: this.iter },
        currentMouse: { value: this.currentMouse } });


    });_defineProperty(this, "createApp",

    () => {
      // Renderer
      this.renderer = new THREE.WebGLRenderer({
        devicePixelRatio: 1.5,
        antialias: true });

      this.renderer.setSize(
      this.appContainer.offsetWidth,
      this.appContainer.offsetHeight);

      this.appContainer.appendChild(this.renderer.domElement);

      // Camera
      this.camera = new THREE.PerspectiveCamera(
      45,
      this.appContainer.offsetWidth / this.appContainer.offsetHeight,
      1,
      10000);

      this.camera.position.set(-3, 2, this.settings.cameraDistance);
      this.scene = new THREE.Scene();
      this.scene.background = new THREE.Color(this.settings.bgColor);

      // Orbit Controls
      this.controls = new OrbitControls(this.camera, this.renderer.domElement);
      this.controls.enableKeys = false;
      this.controls.enableZoom = false;
      this.controls.enableDamping = false;

      // Ambient Light
      // let ambientLight = new THREE.AmbientLight(0x0000ff, 0.15);
      // this.scene.add(ambientLight);

      // Directional Light
      let directionalLight = new THREE.DirectionalLight(0x4400ff, 0.4);
      directionalLight.position.set(5, 3, 2);
      directionalLight.target.position.set(0, 0, 0);
      this.scene.add(directionalLight);
    });_defineProperty(this, "createItems",

    () => {
      // Create the geometry
      const imageRatio = 1304 / 2000;
      const imageWidth = 60;
      this.geometry = new THREE.PlaneBufferGeometry(
      imageWidth,
      imageWidth * imageRatio,
      16 * 2,
      9 * 2);


      // Create the material
      let shaderMaterial = new THREE.ShaderMaterial({
        uniforms: this.uniforms,
        vertexShader: document.getElementById("vertexShader").textContent,
        fragmentShader: document.getElementById("fragmentShader").textContent,
        depthTest: false,
        transparent: true,
        vertexColors: true,
        side: THREE.DoubleSide });


      const message = "Your ideal creative \ndevelopment partner.";
      const shapes = this.font.generateShapes(message, 8);
      const geometry = new THREE.ShapeBufferGeometry(shapes);
      geometry.computeBoundingBox();
      const xMid =
      -0.5 * (geometry.boundingBox.max.x - geometry.boundingBox.min.x);
      const yMid =
      0.3 * (geometry.boundingBox.max.y - geometry.boundingBox.min.y);
      geometry.translate(xMid, yMid, 0);

      this.mesh = new THREE.Mesh(geometry, shaderMaterial);
      this.scene.add(this.mesh);

      // Create sphere
      let blobGeom = new THREE.TorusGeometry(10, 3, 16, 100);
      let blobMat = new THREE.MeshPhongMaterial({
        color: 0xffffff,
        specular: 0x0000ff,
        shininess: 6 });

      this.blobMesh = new THREE.Mesh(blobGeom, blobMat);
      this.scene.add(this.blobMesh);

      // Fit camera
      this.updateCamera();
    });_defineProperty(this, "addEventListeners",

    () => {
      this.appContainer.addEventListener("mousemove", this.onMouseMove);
    });_defineProperty(this, "onMouseMove",

    evt => {
      // Mesh scale grows as mouse moves
      if (this.targetMeshScale <= this.settings.blobMaxScale) {
        this.targetMeshScale += this.settings.blobInflate;
      }

      // Project mouse position onto Z plane based on camera
      let vec = new THREE.Vector3();
      let pos = new THREE.Vector3();
      vec.set(
      evt.clientX / window.innerWidth * 2 - 1,
      -(evt.clientY / window.innerHeight) * 2 + 1,
      0.5);

      vec.unproject(this.camera);
      vec.sub(this.camera.position).normalize();
      let distance = -this.camera.position.z / vec.z;
      pos.copy(this.camera.position).add(vec.multiplyScalar(distance));

      this.targetMouse = { x: pos.x, y: pos.y };
    });_defineProperty(this, "updateMouse",

    () => {
      const mouseDiffX =
      (this.targetMouse.x - this.currentMouse.x) * this.settings.mouseEase;
      const mouseDiffY =
      (this.targetMouse.y - this.currentMouse.y) * this.settings.mouseEase;

      this.currentMouse.x += mouseDiffX;
      this.currentMouse.y += mouseDiffY;
    });_defineProperty(this, "updateItems",

    () => {
      // Blob follows mouse
      this.blobMesh.position.set(this.currentMouse.x, this.currentMouse.y, 0);

      // Blob rotates
      const rotateSpeed =
      Math.abs(this.targetMouse.x - this.currentMouse.x) * 0.002 + 0.01;
      this.blobMesh.rotation.x += rotateSpeed;
      this.blobMesh.rotation.y += rotateSpeed;
      this.blobMesh.rotation.z += rotateSpeed;

      // Blob size based on mousemovement
      const scaleEffect =
      (this.targetMeshScale - this.blobMesh.scale.x) *
      this.settings.blobScaleEase;
      this.blobMesh.scale.set(
      this.blobMesh.scale.x + scaleEffect,
      this.blobMesh.scale.x + scaleEffect,
      this.blobMesh.scale.x + scaleEffect);


      if (this.targetMeshScale > this.settings.blobMinScale) {
        this.targetMeshScale -= this.settings.blobDeflate;
      }
    });_defineProperty(this, "updateCamera",

    () => {
      // Fill viewport
      this.camera.aspect =
      this.appContainer.offsetWidth / this.appContainer.offsetHeight;
      this.camera.updateProjectionMatrix();
      this.renderer.setSize(
      this.appContainer.offsetWidth,
      this.appContainer.offsetHeight);


      // Fit camera to type
      const dist = this.camera.position.distanceTo(this.mesh.position);
      const w =
      this.mesh.geometry.boundingBox.max.x -
      this.mesh.geometry.boundingBox.min.x;
      const aspect =
      this.appContainer.offsetWidth / this.appContainer.offsetHeight;
      const fov = 2 * Math.atan(w / aspect / (2 * dist)) * (180 / Math.PI); // in degrees
      this.camera.fov = fov * 1.2;
    });_defineProperty(this, "update",

    () => {
      this.iter++;
      this.updateMouse();
      this.updateUniforms();
      this.updateCamera();
      this.updateItems();
      this.renderer.render(this.scene, this.camera);
      window.requestAnimationFrame(this.update);
    });this.options = options;this.appContainer = document.querySelector(this.options.appContainerSelector);this.iter = 0; // THREE items
    this.renderer;this.camera;this.scene;this.controls;this.imageTexture;this.uniforms;this.geometry;this.mesh;this.font;this.targetMeshScale = 1; // Mouse
    this.currentMouse = { x: 0, y: 0 };this.targetMouse = { x: 0, y: 0 }; // Settings
    this.settings = { cameraDistance: 100, bgColor: 0x111, mouseEase: 0.05, blobMinScale: 1, blobMaxScale: 2, blobScaleEase: 0.05, blobInflate: 0.015, blobDeflate: 0.01 };this.init();}}new ThreeText();