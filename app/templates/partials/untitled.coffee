lcs = @supermodel.getModels LevelComponent
allDocs = {}
for lc in lcs
  for doc in (lc.get('propertyDocumentation') ? [])
    doc = _.clone doc
    allDocs['__' + doc.name] ?= []
    allDocs['__' + doc.name].push doc
    if doc.type is 'snippet' then doc.owner = 'snippets'

if @options.programmable
  propStorage =
    'this': 'programmableProperties'
    more: 'moreProgrammableProperties'
    Math: 'programmableMathProperties'
    Array: 'programmableArrayProperties'
    Object: 'programmableObjectProperties'
    String: 'programmableStringProperties'
    Vector: 'programmableVectorProperties'
    snippets: 'programmableSnippets'
else
  propStorage =
    'this': 'apiProperties'

propGroups = {}
for owner, storage of propStorage
  props = _.reject @thang[storage] ? [], (prop) -> prop[0] is '_'
  propGroups[owner] = _.sortBy(props).slice()

snippetEntries = []
for owner, props of propGroups
  for prop in props
    doc = _.find (allDocs['__' + prop] ? []), (doc) ->
      return true if doc.owner is owner
      return (owner is 'this' or owner is 'more') and (not doc.owner? or doc.owner is 'this')
    console.log 'could not find doc for', prop, 'from', allDocs['__' + prop], 'for', owner, 'of', propGroups unless doc
    doc ?= prop
    entry = 
      content: doc.snippets[@spell.language].code
      name: doc.name
      tabTrigger: doc.snippets[@spell.language].tab
    snippetEntries.push entry

@zatanna.addSnippets snippetEntries