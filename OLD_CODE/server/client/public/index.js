// import { set, to, fromTo } from './node_modules/gsap/dist/gsap';

// set("svg", {
//   visibility: "visible"
// });
// to("#headStripe", {
//   y: 0.5,
//   rotation: 1,
//   yoyo: true,
//   repeat: -1,
//   ease: "sine.inOut",
//   duration: 1
// });
// to("#spaceman", {
//   y: 0.5,
//   rotation: 1,
//   yoyo: true,
//   repeat: -1,
//   ease: "sine.inOut",
//   duration: 1
// });
// to("#craterSmall", {
//   x: -3,
//   yoyo: true,
//   repeat: -1,
//   duration: 1,
//   ease: "sine.inOut"
// });
// to("#craterBig", {
//   x: 3,
//   yoyo: true,
//   repeat: -1,
//   duration: 1,
//   ease: "sine.inOut"
// });
// to("#planet", {
//   rotation: -2,
//   yoyo: true,
//   repeat: -1,
//   duration: 1,
//   ease: "sine.inOut",
//   transformOrigin: "50% 50%"
// });
// to("#starsBig g", {
//   rotation: "random(-30,30)",
//   transformOrigin: "50% 50%",
//   yoyo: true,
//   repeat: -1,
//   ease: "sine.inOut"
// });
// fromTo("#starsSmall g", {
//   scale: 0,
//   transformOrigin: "50% 50%"
// }, {
//   scale: 1,
//   transformOrigin: "50% 50%",
//   yoyo: true,
//   repeat: -1,
//   stagger: 0.1
// });
// to("#circlesSmall circle", {
//   y: -4,
//   yoyo: true,
//   duration: 1,
//   ease: "sine.inOut",
//   repeat: -1
// });
// to("#circlesBig circle", {
//   y: -2,
//   yoyo: true,
//   duration: 1,
//   ease: "sine.inOut",
//   repeat: -1
// });
// set("#glassShine", {
//   x: -68
// });
// to("#glassShine", {
//   x: 80,
//   duration: 2,
//   rotation: -30,
//   ease: "expo.inOut",
//   transformOrigin: "50% 50%",
//   repeat: -1,
//   repeatDelay: 8,
//   delay: 2
// });

window.onload=function(){
  const burger = document.querySelector(".burger");
  const nav = document.querySelector("nav");
  burger.addEventListener("click", e => {
    burger.dataset.state === "closed" ? burger.dataset.state = "open" : burger.dataset.state = "closed";
    nav.dataset.state === "closed" ? nav.dataset.state = "open" : nav.dataset.state = "closed";
  });
}