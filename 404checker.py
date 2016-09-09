from scrapy.selector import HtmlXPathSelector
from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors.sgml import SgmlLinkExtractor
from scrapy.item import Item, Field
from scrapy.linkextractors import LinkExtractor
import config



class BrokenItem(Item):
    url = Field()
    referer = Field()
    status = Field()


class BrokenLinksSpider(CrawlSpider):
    name = config.name
    allowed_domains = config.allowed_domains
    start_urls = config.start_urls
    handle_httpstatus_list = [404]
    rules = (Rule(LinkExtractor(deny=('jira')), callback='parse_item', follow=True),) #ignores any links with 'JIRA' in them


    def parse_item(self, response):
        if response.status == 404:
            item = BrokenItem()
            item['url'] = response.url
            item['referer'] = response.request.headers.get('Referer')
            item['status'] = response.status

            return item
