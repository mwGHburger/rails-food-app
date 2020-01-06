import Typed from "typed.js";

const loadDynamicBannerText = () => {
  new Typed("#banner-typed-text", {
    strings: ["EXPLORE", "DISCOVER", "EAT", "REPEAT"],
    typeSpeed: 150,
    loop: true
  });
};

export { loadDynamicBannerText };
