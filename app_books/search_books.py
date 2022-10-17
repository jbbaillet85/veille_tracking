from django.contrib.postgres.search import SearchVector
from app_books.models import Book


class SearchBooks:
    def __init__(self, keyword: str) -> None:
        self.keyword = keyword
        self.result_search = self.search_books()

    def search_books(self):
        search = (
            SearchVector("title")
            + SearchVector("ISBN")
            + SearchVector("more_infos")
            + SearchVector("count_pages")
            + SearchVector("slug")
            + SearchVector("author_id")
            + SearchVector("edition_id")
        )
        result_search = (
            Book.objects.annotate(search=search)
            .filter(search=self.keyword)
            .order_by("title")
        )
        return result_search

    def __str__(self) -> str:
        return f"keyword: {self.keyword}"
