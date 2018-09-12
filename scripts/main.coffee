activate = ->
    $('#huldigen').click ->
        degree = Math.random() * 360
        $('.page-header').css('transform', 'rotate(' + degree + 'deg)')
    $('#neon-shizzle-button').click ->
        $('#neon-shizzle').css('display', 'flex')
    $('#close-neon-shizzle').click ->
        $('#neon-shizzle').css('display', 'none')

$(document).ready(activate)