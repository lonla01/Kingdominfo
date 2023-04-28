Rails.application.config.dartsass.builds = {
    "style.scss"       => "style.css",
    "slick.scss"       => "slick.css",
    "login.scss"       => "login.css"
}

Rails.application.config.dartsass.build_options << " --quiet-deps"