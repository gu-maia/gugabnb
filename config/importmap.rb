# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: '@hotwired--stimulus.js' # @3.1.0
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'tailwindcss-stimulus-components' # @3.0.4
pin "axios", to: "https://ga.jspm.io/npm:axios@1.1.3/index.js"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "#lib/platform/node/index.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "form-data", to: "https://ga.jspm.io/npm:form-data@4.0.0/lib/browser.js"
