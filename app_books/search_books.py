from django.contrib.postgres.search import SearchVector
from app_books.models import Book


class SearchBooks:
    """
    SearchBooks is a class used to search for books based on keyword.
    """

    def __init__(self, keyword: str) -> None:
        """
        Initialize the class with the keyword to search for.

        Args:
        keyword (str): The keyword to search for.

        Returns:
        None
        """
        self.keyword = keyword
        self.result_search = self.search_books()

    def search_books(self):
        """
        Search books based on keyword and return the result.

        Returns:
        QuerySet: The result of the search.
        """
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
        """
        Represent the SearchBooks class as a string.

        Returns:
        str: The string representation of the class.
        """
        return f"keyword: {self.keyword}"
