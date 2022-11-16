import 'package:get/get.dart';

const String TITLE = 'title';
const String HOME = 'home';
const String FIND = 'find';
const String SEARCHED_TEXT = 'searchedText';
const String YES = 'yes';
const String NO = 'no';
const String TRY_RELOAD = 'tryReload';
const String NO_IMAGE = 'noImageData';
const String NO_DATA = 'No data';
const String FILTER = 'filter';
const String TOO_MUCH_SHORT = 'tooMuchShort';
const String NOTHNING_FOUND = 'nothingFound';
const String TRY_CHANGE_REQUEST = 'tryChangeRequest';
const String PUBLISHER = 'publisher';
const String PAGES = 'pages';
const String YEAR = 'year';
const String PRICE = 'price';
const String RATING = 'rating';
const String AUTHORS = 'authors';
const String GO_TO_WEB_SITE = 'goToWebSite';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // ENGLISH LANGUAGE
        'en': {
          TITLE: 'Test',
          HOME: 'Home',
          FIND: 'Find',
          SEARCHED_TEXT: 'searched text',
          YES: 'yes',
          NO: 'no',
          NO_IMAGE: 'no image data',
          NO_DATA: 'No data',
          TRY_RELOAD: 'Try reload',
          FILTER: 'Filter',
          TOO_MUCH_SHORT: 'too much short text',
          NOTHNING_FOUND: 'Nothing found.',
          TRY_CHANGE_REQUEST: 'Try to change the content of the request.',
          PUBLISHER: 'Publisher: ',
          PAGES: 'Pages: ',
          YEAR: 'Year: ',
          PRICE: 'Price: ',
          RATING: 'Rating: ',
          AUTHORS: 'Authors: ',
          GO_TO_WEB_SITE: 'Go to web site',
        },

        // CZECH LANGUAGE
        'cs': {
          TITLE: 'Test',
          HOME: 'Domů',
          FIND: 'Hledat',
          SEARCHED_TEXT: 'hledaný text',
          YES: 'ano',
          NO: 'ne',
          NO_IMAGE: 'obrázek není k dispozici',
          PUBLISHER: 'Publisher: ',
          NO_DATA: 'Žádný obsah',
          TRY_RELOAD: 'Zkusit znovu',
          FILTER: 'Filtruj',
          TOO_MUCH_SHORT: 'příliš krátky text',
          NOTHNING_FOUND: 'Nic nenalezeno.',
          TRY_CHANGE_REQUEST: 'Zkuste změnit obsah dotazu.',
          PUBLISHER: 'Vydavatel: ',
          PAGES: 'Stránek: ',
          YEAR: 'Rok: ',
          PRICE: 'Cena: ',
          RATING: 'Rating: ',
          AUTHORS: 'Autor: ',
          GO_TO_WEB_SITE: 'Přejít na web',
        },
      };
}
