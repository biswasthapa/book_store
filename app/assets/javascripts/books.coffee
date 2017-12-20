# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  if getParameterByName('per_page')
    $('#books_per_page_select').val getParameterByName('per_page')

  $('#books_per_page_select').on 'change', ->
    getBooksPerPage($('#books_per_page_select').val(), $('#category_select').val(),  $('#author_select').val(), $('#search_books').val())

  $('#category_select').on 'change', ->
    getBooksPerPage($('#books_per_page_select').val(), $('#category_select').val(),  $('#author_select').val(), $('#search_books').val())

  $('#author_select').on 'change', ->
    getBooksPerPage($('#books_per_page_select').val(), $('#category_select').val(), $('#author_select').val(), $('#search_books').val())

  $(".search-books-button").on 'click',(evt) ->
    evt.preventDefault();
    getBooksPerPage($('#books_per_page_select').val(), $('#category_select').val(), $('#author_select').val(), $('#search_books').val())

  getBooksPerPage = (per_page, category, author, search) ->
    $.ajax
      type: 'GET'
      data: { per_page: per_page, category: category, author: author, search: search}
      url: '/books.json'
      success: (response) ->
        $('.books-pagination').html(response.pagination)
        $('.books-count').html(response.books.length)
        $('.books-data').empty()
        booksList = ""
        $.each response.books, (index, book) ->
          booksList = booksList + "<div class='cell'><div class='card'>" + book.book_image_url +
                      "<div class='card-section'><div class='book-title-text'>" + book.title + "</div>" +
                      "<div class='book-author-text'>by&nbsp;" + book.author_name + "</div><br>" +
                      "<p>" + book.card_description + "<a class='more-details' href='/books/" + book.id +
                      "'>more details</a></p>" + "<div class='float-left'><div class='book-title-text'>$&nbsp;" + book.unit_price +
                      "</div></div><div class='float-right cart-image'>" + book.add_to_cart_image +
                      "</div></div></div></div>"

        $(".books-data").html(booksList)