# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "js-cookie", to: "https://ga.jspm.io/npm:js-cookie@3.0.1/dist/js.cookie.mjs"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"

pin "swiper", to: "https://ga.jspm.io/npm:swiper@8.0.7/swiper.esm.js"
pin "dom7", to: "https://ga.jspm.io/npm:dom7@4.0.4/dom7.esm.js"
pin "ssr-window", to: "https://ga.jspm.io/npm:ssr-window@4.0.2/ssr-window.esm.js"
pin "tom-select", to: "https://ga.jspm.io/npm:tom-select@2.0.1/dist/js/tom-select.complete.js"
