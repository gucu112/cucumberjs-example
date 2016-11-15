module.exports = () ->

    # Handlers goes here
    @registerHandler 'BeforeFeature', (feature) =>
        tags = feature.getTags().map (tag) -> tag.getName()
        if tags.includes '@login'
            @url = '/login' # (TODO)
        return
    
    return