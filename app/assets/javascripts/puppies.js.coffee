# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(window).load ->
  $('.collection').bind "click", (event) =>
    changeCollection(event.currentTarget)

  $('.hero:visible > div > p').ellipsis(2)

changeCollection = (collection) ->
  currentHero = $('section.hero:visible')
  currentCollection = $('section.collection.shadowed')
  targetIndex = getCollectionIndex(collection)

  $('#collection-'+targetIndex).toggleClass('shadowed')
  currentCollection.toggleClass('shadowed')

  $('#hero'+targetIndex).toggleClass('hidden')
  currentHero.toggleClass('hidden')
  $('#hero'+targetIndex+' > div > p').ellipsis(2)

getCollectionIndex = (collection) ->
  parseInt(collection.id.split('-')[1])
