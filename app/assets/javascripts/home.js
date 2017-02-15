// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).ready(function() {

    // Convert the filter editor into a token select
    var filterBox = $('[name="filter[]"]');
    filterBox.select2({
        tags: true,
        tokenSeparators: [',', ' '],
        width: '300px',
        minimumResultsForSearch: Infinity
    });

});