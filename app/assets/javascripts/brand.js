$(function() {
  function selectBrand(brand) {
    let html = `
      <div class="brand_list" data-brand-name="${brand.name}">
        <p class="brand_list__name data-brand-id="${brand.id}"">${brand.name}</p>`;
    $("#brand-search-result").append(html);
  }

  function addNoBrand() {
    let html = `
      <div>
        <p>ブランドが見つかりません</p>
      </div>
    `;
    $("#brand-search-result").append(html);
  }
  $("#brand-search-field").on("keyup", function() {
    let input = $("#brand-search-field").val();
    $.ajax({
      type: "GET",
      url: "brand",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(brands) {
      $("#brand-search-result").empty();
      if (brands.length !== 0) {
        brands.forEach(function(brand) {
          selectBrand(brand);
        });
      } else if (input.length === 0) {
        return false;
      } else {
        addNoBrand();
      }
    })
    .fail(function() {
      alert("通信エラーです。ブランドが表示できません。");
    });
    $(document).on("click", ".brand_list", function() {
      const brandName = $(this).attr("data-brand-name");
      const brandId = $(this).attr("data-brand-id");
      $(this).parent().prev().val(brandName);
      $(this).parent().remove();
    });
  });
});