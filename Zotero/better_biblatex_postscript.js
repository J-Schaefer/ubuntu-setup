if (Translator.BetterBibLaTeX) {    // check for translator
    switch (item.itemType) {    // check which item currently being translated
        case 'videoRecording':  // item Video
        case 'film':    // item Movie
            item.creators.forEach(creator => {
                if (creator.creatorType === 'director') creator.creatorType = 'author'    // replace director for author
            })
            this.addCreators();    // print creators
            break;
        case 'patent':
            item.creators.forEach(creator => {
                if (creator.creatorType === 'inventor') creator.creatorType = 'author'    // replace holder for author
            })
            this.addCreators();    // print creators
            break;
    }
}