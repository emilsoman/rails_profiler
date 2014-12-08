//= require reqwest.min

function updateResult() {
  reqwest("/rails_profiler/result.json", function (res) {
    document.getElementsByClassName('rails-profiler-total-memgrowth')[0].innerHTML = res.total_memory_growth;
  });
}

function startUpdating() {
  setInterval(updateResult, 4000);
}
