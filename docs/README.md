# kubes Documentation

This project powers the kubes documementation website: [https://kubes.guru](https://kubes.guru).  It is a static website generated by [Jekyll](https://jekyllrb.com/).

## Contributing

For minor changes like typos, you can click **Suggest an edit to this page**, located at the bottom of each article. This will take you to the source file on GitHub, where you can submit a pull request for your change through the UI.

## Local Setup

For larger fixes, you can run the site locally with the following:

    git clone https://github.com/boltops-tools/kubes
    cd kubes/docs
    bundle
    foreman start

You'll be able to view the site on [http://localhost:4000](http://localhost:4000).

## Html Proofer

Run it locally once in a while. Sometimes external sites are intermittently down, even GitHub.

    bundle exec rake html:proof