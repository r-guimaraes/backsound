$ ->
    $("a[data-remote").on "ajax:success", (evt) ->
        [data, status, xhr] = evt.detail
        console.log status
        console.log xhr
        console.log data