$( document ).ready(function() {

    // Convert the filter editor into a token select
    var filterBox = $('[name="filter[]"]');
    filterBox.select2({
        tags: true,
        tokenSeparators: [',', ' '],
        width: '300px',
        minimumResultsForSearch: Infinity,
        placeholder: 'Enter tags to search...'
    });

});