// https://github.com/christian-fei/Simple-Jekyll-Search#usage
document.addEventListener("DOMContentLoaded", function () {
  SimpleJekyllSearch({
    json: "/assets/json/search.json",
    searchInput: document.getElementById("search-input"),
    resultsContainer: document.getElementById("results-container"),
    fuzzy: true,
    noResultsText: "not found",
  });
});
