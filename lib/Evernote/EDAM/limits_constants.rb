#
# Autogenerated by Thrift Compiler (0.5.0-en-exported)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'limits_types'

module Evernote
  module EDAM
    module Limits
      EDAM_ATTRIBUTE_LEN_MIN = 1

      EDAM_ATTRIBUTE_LEN_MAX = 4096

      EDAM_ATTRIBUTE_REGEX = %q"^[^\\p{Cc}\\p{Zl}\\p{Zp}]{1,4096}$"

      EDAM_ATTRIBUTE_LIST_MAX = 100

      EDAM_ATTRIBUTE_MAP_MAX = 100

      EDAM_GUID_LEN_MIN = 36

      EDAM_GUID_LEN_MAX = 36

      EDAM_GUID_REGEX = %q"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"

      EDAM_EMAIL_LEN_MIN = 6

      EDAM_EMAIL_LEN_MAX = 255

      EDAM_EMAIL_LOCAL_REGEX = %q"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*$"

      EDAM_EMAIL_DOMAIN_REGEX = %q"^[A-Za-z0-9-]*[A-Za-z0-9](\\.[A-Za-z0-9-]*[A-Za-z0-9])*\\.([A-Za-z]{2,})$"

      EDAM_EMAIL_REGEX = %q"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@[A-Za-z0-9-]*[A-Za-z0-9](\\.[A-Za-z0-9-]*[A-Za-z0-9])*\\.([A-Za-z]{2,})$"

      EDAM_VAT_REGEX = %q"^(AT)?U[0-9]{8}$|^(BE)?0?[0-9]{9}$|^(BG)?[0-9]{9,10}$|^(CY)?[0-9]{8}L$|^(CZ)?[0-9]{8,10}$|^(DE)?[0-9]{9}$|^(DK)?[0-9]{8}$|^(EE)?[0-9]{9}$|^(EL|GR)?[0-9]{9}$|^(ES)?[0-9A-Z][0-9]{7}[0-9A-Z]$|^(FI)?[0-9]{8}$|^(FR)?[0-9A-Z]{2}[0-9]{9}$|^(GB)?([0-9]{9}([0-9]{3})?|[A-Z]{2}[0-9]{3})$|^(HU)?[0-9]{8}$|^(IE)?[0-9]S[0-9]{5}L$|^(IT)?[0-9]{11}$|^(LT)?([0-9]{9}|[0-9]{12})$|^(LU)?[0-9]{8}$|^(LV)?[0-9]{11}$|^(MT)?[0-9]{8}$|^(NL)?[0-9]{9}B[0-9]{2}$|^(PL)?[0-9]{10}$|^(PT)?[0-9]{9}$|^(RO)?[0-9]{2,10}$|^(SE)?[0-9]{12}$|^(SI)?[0-9]{8}$|^(SK)?[0-9]{10}$|^[0-9]{9}MVA$|^[0-9]{6}$|^CHE[0-9]{9}(TVA|MWST|IVA)$"

      EDAM_TIMEZONE_LEN_MIN = 1

      EDAM_TIMEZONE_LEN_MAX = 32

      EDAM_TIMEZONE_REGEX = %q"^([A-Za-z_-]+(/[A-Za-z_-]+)*)|(GMT(-|\\+)[0-9]{1,2}(:[0-9]{2})?)$"

      EDAM_MIME_LEN_MIN = 3

      EDAM_MIME_LEN_MAX = 255

      EDAM_MIME_REGEX = %q"^[A-Za-z]+/[A-Za-z0-9._+-]+$"

      EDAM_MIME_TYPE_GIF = %q"image/gif"

      EDAM_MIME_TYPE_JPEG = %q"image/jpeg"

      EDAM_MIME_TYPE_PNG = %q"image/png"

      EDAM_MIME_TYPE_TIFF = %q"image/tiff"

      EDAM_MIME_TYPE_WAV = %q"audio/wav"

      EDAM_MIME_TYPE_MP3 = %q"audio/mpeg"

      EDAM_MIME_TYPE_AMR = %q"audio/amr"

      EDAM_MIME_TYPE_AAC = %q"audio/aac"

      EDAM_MIME_TYPE_M4A = %q"audio/mp4"

      EDAM_MIME_TYPE_MP4_VIDEO = %q"video/mp4"

      EDAM_MIME_TYPE_INK = %q"application/vnd.evernote.ink"

      EDAM_MIME_TYPE_PDF = %q"application/pdf"

      EDAM_MIME_TYPE_DEFAULT = %q"application/octet-stream"

      EDAM_MIME_TYPES = Set.new([
        %q"image/gif",
        %q"image/jpeg",
        %q"image/png",
        %q"audio/wav",
        %q"audio/mpeg",
        %q"audio/amr",
        %q"application/vnd.evernote.ink",
        %q"application/pdf",
        %q"video/mp4",
        %q"audio/aac",
        %q"audio/mp4",
      ])

      EDAM_INDEXABLE_RESOURCE_MIME_TYPES = Set.new([
        %q"application/msword",
        %q"application/mspowerpoint",
        %q"application/excel",
        %q"application/vnd.ms-word",
        %q"application/vnd.ms-powerpoint",
        %q"application/vnd.ms-excel",
        %q"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        %q"application/vnd.openxmlformats-officedocument.presentationml.presentation",
        %q"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        %q"application/vnd.apple.pages",
        %q"application/vnd.apple.numbers",
        %q"application/vnd.apple.keynote",
        %q"application/x-iwork-pages-sffpages",
        %q"application/x-iwork-numbers-sffnumbers",
        %q"application/x-iwork-keynote-sffkey",
      ])

      EDAM_COMMERCE_SERVICE_EVERNOTE = %q"Evernote"

      EDAM_COMMERCE_SERVICE_GOOGLE = %q"Google"

      EDAM_COMMERCE_SERVICE_PAYPAL = %q"Paypal"

      EDAM_COMMERCE_SERVICE_PAYPALRT = %q"PaypalRT"

      EDAM_COMMERCE_SERVICE_GIFT = %q"Gift"

      EDAM_COMMERCE_SERVICE_TRIALPAY = %q"TrialPay"

      EDAM_COMMERCE_SERVICE_TRIAL = %q"Trial"

      EDAM_COMMERCE_SERVICE_GROUP = %q"Group"

      EDAM_COMMERCE_SERVICE_BUNDLE = %q"Bundle"

      EDAM_COMMERCE_SERVICE_POINTS = %q"Points"

      EDAM_COMMERCE_SERVICE_CYBERSOURCE = %q"CYBERSRC"

      EDAM_COMMERCE_SERVICE_ANDROID = %q"ANDROID"

      EDAM_COMMERCE_SERVICE_AMAZON = %q"AMAZON"

      EDAM_COMMERCE_SERVICE_IPHONE = %q"ITUNES"

      EDAM_COMMERCE_SERVICE_IPHONE_SKITCH = %q"ITUNES_S"

      EDAM_COMMERCE_SERVICE_MAC = %q"ITUNES_X"

      EDAM_COMMERCE_SERVICE_BLACKBERRY = %q"BB_WORLD"

      EDAM_COMMERCE_SERVICE_BUSINESS = %q"BUSINESS"

      EDAM_COMMERCE_SERVICE_VAULT_CC_ADYEN = %q"Biz-CC"

      EDAM_COMMERCE_SERVICE_VAULT_CC_CYBERSOURCE = %q"BIZ_CYB"

      EDAM_COMMERCE_SERVICE_VAULT_INVOICE = %q"Biz-INV"

      EDAM_COMMERCE_SERVICE_VAULT_TRANSFER = %q"TRANSFER"

      EDAM_COMMERCE_SERVICE_ADYEN_ALIPAY = %q"ALIPAY"

      EDAM_COMMERCE_SERVICE_ADYEN_BOKU = %q"ADY_BOKU"

      EDAM_COMMERCE_SERVICE_ADYEN_CREDITCARD = %q"ADYEN_CC"

      EDAM_COMMERCE_SERVICE_ADYEN_PAYPAL = %q"ADYEN_PP"

      EDAM_COMMERCE_SERVICE_CASH_ON_DELIVERY = %q"COD"

      EDAM_COMMERCE_SERVICE_REPLACEMENT = %q"REPL"

      EDAM_COMMERCE_SERVICE_RESELLER = %q"RESELLER"

      EDAM_COMMERCE_SERVICE_FRIEND_REFERRAL = %q"FRND_REF"

      EDAM_COMMERCE_DEFAULT_CURRENCY_COUNTRY_CODE = %q"USD"

      EDAM_SEARCH_QUERY_LEN_MIN = 0

      EDAM_SEARCH_QUERY_LEN_MAX = 1024

      EDAM_SEARCH_QUERY_REGEX = %q"^[^\\p{Cc}\\p{Zl}\\p{Zp}]{0,1024}$"

      EDAM_HASH_LEN = 16

      EDAM_USER_USERNAME_LEN_MIN = 1

      EDAM_USER_USERNAME_LEN_MAX = 64

      EDAM_USER_USERNAME_REGEX = %q"^[a-z0-9]([a-z0-9_-]{0,62}[a-z0-9])?$"

      EDAM_USER_NAME_LEN_MIN = 1

      EDAM_USER_NAME_LEN_MAX = 255

      EDAM_USER_NAME_REGEX = %q"^[^\\p{Cc}\\p{Zl}\\p{Zp}]{1,255}$"

      EDAM_TAG_NAME_LEN_MIN = 1

      EDAM_TAG_NAME_LEN_MAX = 100

      EDAM_TAG_NAME_REGEX = %q"^[^,\\p{Cc}\\p{Z}]([^,\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^,\\p{Cc}\\p{Z}])?$"

      EDAM_NOTE_TITLE_LEN_MIN = 1

      EDAM_NOTE_TITLE_LEN_MAX = 255

      EDAM_NOTE_TITLE_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,253}[^\\p{Cc}\\p{Z}])?$"

      EDAM_NOTE_CONTENT_LEN_MIN = 0

      EDAM_NOTE_CONTENT_LEN_MAX = 5242880

      EDAM_APPLICATIONDATA_NAME_LEN_MIN = 3

      EDAM_APPLICATIONDATA_NAME_LEN_MAX = 32

      EDAM_APPLICATIONDATA_VALUE_LEN_MIN = 0

      EDAM_APPLICATIONDATA_VALUE_LEN_MAX = 4092

      EDAM_APPLICATIONDATA_ENTRY_LEN_MAX = 4095

      EDAM_APPLICATIONDATA_NAME_REGEX = %q"^[A-Za-z0-9_.-]{3,32}$"

      EDAM_APPLICATIONDATA_VALUE_REGEX = %q"^[\\p{Space}[^\\p{Cc}]]{0,4092}$"

      EDAM_NOTEBOOK_NAME_LEN_MIN = 1

      EDAM_NOTEBOOK_NAME_LEN_MAX = 100

      EDAM_NOTEBOOK_NAME_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^\\p{Cc}\\p{Z}])?$"

      EDAM_NOTEBOOK_STACK_LEN_MIN = 1

      EDAM_NOTEBOOK_STACK_LEN_MAX = 100

      EDAM_NOTEBOOK_STACK_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^\\p{Cc}\\p{Z}])?$"

      EDAM_PUBLISHING_URI_LEN_MIN = 1

      EDAM_PUBLISHING_URI_LEN_MAX = 255

      EDAM_PUBLISHING_URI_REGEX = %q"^[a-zA-Z0-9.~_+-]{1,255}$"

      EDAM_PUBLISHING_URI_PROHIBITED = Set.new([
        %q".",
        %q"..",
      ])

      EDAM_PUBLISHING_DESCRIPTION_LEN_MIN = 1

      EDAM_PUBLISHING_DESCRIPTION_LEN_MAX = 200

      EDAM_PUBLISHING_DESCRIPTION_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,198}[^\\p{Cc}\\p{Z}])?$"

      EDAM_SAVED_SEARCH_NAME_LEN_MIN = 1

      EDAM_SAVED_SEARCH_NAME_LEN_MAX = 100

      EDAM_SAVED_SEARCH_NAME_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^\\p{Cc}\\p{Z}])?$"

      EDAM_USER_PASSWORD_LEN_MIN = 6

      EDAM_USER_PASSWORD_LEN_MAX = 64

      EDAM_USER_PASSWORD_REGEX = %q"^[A-Za-z0-9!#$%&'()*+,./:;<=>?@^_`{|}~\\[\\]\\\\-]{6,64}$"

      EDAM_BUSINESS_URI_LEN_MAX = 32

      EDAM_BUSINESS_MARKETING_CODE_REGEX_PATTERN = %q"[A-Za-z0-9-]{1,128}"

      EDAM_NOTE_TAGS_MAX = 100

      EDAM_NOTE_RESOURCES_MAX = 1000

      EDAM_USER_TAGS_MAX = 100000

      EDAM_BUSINESS_TAGS_MAX = 100000

      EDAM_USER_SAVED_SEARCHES_MAX = 100

      EDAM_USER_NOTES_MAX = 100000

      EDAM_BUSINESS_NOTES_MAX = 500000

      EDAM_USER_NOTEBOOKS_MAX = 250

      EDAM_BUSINESS_NOTEBOOKS_MAX = 10000

      EDAM_USER_RECENT_MAILED_ADDRESSES_MAX = 10

      EDAM_USER_MAIL_LIMIT_DAILY_FREE = 50

      EDAM_USER_MAIL_LIMIT_DAILY_PREMIUM = 200

      EDAM_USER_UPLOAD_LIMIT_FREE = 62914560

      EDAM_USER_UPLOAD_LIMIT_PREMIUM = 10737418240

      EDAM_USER_UPLOAD_LIMIT_PLUS = 1073741824

      EDAM_USER_UPLOAD_SURVEY_THRESHOLD = 5368709120

      EDAM_USER_UPLOAD_LIMIT_BUSINESS = 10737418240

      EDAM_USER_UPLOAD_LIMIT_BUSINESS_PER_USER = 2147483647

      EDAM_NOTE_SIZE_MAX_FREE = 26214400

      EDAM_NOTE_SIZE_MAX_PREMIUM = 209715200

      EDAM_RESOURCE_SIZE_MAX_FREE = 26214400

      EDAM_RESOURCE_SIZE_MAX_PREMIUM = 209715200

      EDAM_USER_LINKED_NOTEBOOK_MAX = 100

      EDAM_USER_LINKED_NOTEBOOK_MAX_PREMIUM = 500

      EDAM_NOTEBOOK_BUSINESS_SHARED_NOTEBOOK_MAX = 5000

      EDAM_NOTEBOOK_PERSONAL_SHARED_NOTEBOOK_MAX = 500

      EDAM_NOTE_BUSINESS_SHARED_NOTE_MAX = 1000

      EDAM_NOTE_PERSONAL_SHARED_NOTE_MAX = 100

      EDAM_NOTE_CONTENT_CLASS_LEN_MIN = 3

      EDAM_NOTE_CONTENT_CLASS_LEN_MAX = 32

      EDAM_NOTE_CONTENT_CLASS_REGEX = %q"^[A-Za-z0-9_.-]{3,32}$"

      EDAM_HELLO_APP_CONTENT_CLASS_PREFIX = %q"evernote.hello."

      EDAM_FOOD_APP_CONTENT_CLASS_PREFIX = %q"evernote.food."

      EDAM_CONTENT_CLASS_HELLO_ENCOUNTER = %q"evernote.hello.encounter"

      EDAM_CONTENT_CLASS_HELLO_PROFILE = %q"evernote.hello.profile"

      EDAM_CONTENT_CLASS_FOOD_MEAL = %q"evernote.food.meal"

      EDAM_CONTENT_CLASS_SKITCH_PREFIX = %q"evernote.skitch"

      EDAM_CONTENT_CLASS_SKITCH = %q"evernote.skitch"

      EDAM_CONTENT_CLASS_SKITCH_PDF = %q"evernote.skitch.pdf"

      EDAM_CONTENT_CLASS_PENULTIMATE_PREFIX = %q"evernote.penultimate."

      EDAM_CONTENT_CLASS_PENULTIMATE_NOTEBOOK = %q"evernote.penultimate.notebook"

      EDAM_SOURCE_APPLICATION_POSTIT = %q"postit"

      EDAM_SOURCE_APPLICATION_MOLESKINE = %q"moleskine"

      EDAM_SOURCE_APPLICATION_EN_SCANSNAP = %q"scanner.scansnap.evernote"

      EDAM_SOURCE_APPLICATION_EWC = %q"clipncite.web"

      EDAM_SOURCE_OUTLOOK_CLIPPER = %q"app.ms.outlook"

      EDAM_NOTE_TITLE_QUALITY_UNTITLED = 0

      EDAM_NOTE_TITLE_QUALITY_LOW = 1

      EDAM_NOTE_TITLE_QUALITY_MEDIUM = 2

      EDAM_NOTE_TITLE_QUALITY_HIGH = 3

      EDAM_RELATED_PLAINTEXT_LEN_MIN = 1

      EDAM_RELATED_PLAINTEXT_LEN_MAX = 131072

      EDAM_RELATED_MAX_NOTES = 25

      EDAM_RELATED_MAX_NOTEBOOKS = 1

      EDAM_RELATED_MAX_TAGS = 25

      EDAM_RELATED_MAX_EXPERTS = 10

      EDAM_RELATED_MAX_RELATED_CONTENT = 10

      EDAM_BUSINESS_NOTEBOOK_DESCRIPTION_LEN_MIN = 1

      EDAM_BUSINESS_NOTEBOOK_DESCRIPTION_LEN_MAX = 200

      EDAM_BUSINESS_NOTEBOOK_DESCRIPTION_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,198}[^\\p{Cc}\\p{Z}])?$"

      EDAM_BUSINESS_PHONE_NUMBER_LEN_MAX = 20

      EDAM_PREFERENCE_NAME_LEN_MIN = 3

      EDAM_PREFERENCE_NAME_LEN_MAX = 32

      EDAM_PREFERENCE_VALUE_LEN_MIN = 1

      EDAM_PREFERENCE_VALUE_LEN_MAX = 1024

      EDAM_MAX_PREFERENCES = 100

      EDAM_MAX_VALUES_PER_PREFERENCE = 256

      EDAM_PREFERENCE_ONLY_ONE_VALUE_LEN_MAX = 16384

      EDAM_PREFERENCE_NAME_REGEX = %q"^[A-Za-z0-9_.-]{3,32}$"

      EDAM_PREFERENCE_VALUE_REGEX = %q"^[^\\p{Cc}]{1,1024}$"

      EDAM_PREFERENCE_ONLY_ONE_VALUE_REGEX = %q"^[^\\p{Cc}]{1,16384}$"

      EDAM_PREFERENCE_SHORTCUTS = %q"evernote.shortcuts"

      EDAM_PREFERENCE_BUSINESS_DEFAULT_NOTEBOOK = %q"evernote.business.notebook"

      EDAM_PREFERENCE_BUSINESS_QUICKNOTE = %q"evernote.business.quicknote"

      EDAM_PREFERENCE_SHORTCUTS_MAX_VALUES = 250

      EDAM_DEVICE_ID_LEN_MAX = 32

      EDAM_DEVICE_ID_REGEX = %q"^[^\\p{Cc}]{1,32}$"

      EDAM_DEVICE_DESCRIPTION_LEN_MAX = 64

      EDAM_DEVICE_DESCRIPTION_REGEX = %q"^[^\\p{Cc}]{1,64}$"

      EDAM_SEARCH_SUGGESTIONS_MAX = 10

      EDAM_SEARCH_SUGGESTIONS_PREFIX_LEN_MAX = 1024

      EDAM_SEARCH_SUGGESTIONS_PREFIX_LEN_MIN = 2

      EDAM_FIND_CONTACT_DEFAULT_MAX_RESULTS = 100

      EDAM_FIND_CONTACT_MAX_RESULTS = 256

      EDAM_NOTE_LOCK_VIEWERS_NOTES_MAX = 150

      EDAM_GET_ORDERS_MAX_RESULTS = 2000

      EDAM_MESSAGE_BODY_LEN_MAX = 2048

      EDAM_MESSAGE_BODY_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,2046}[^\\p{Cc}\\p{Z}])?$"

      EDAM_MESSAGE_RECIPIENTS_MAX = 50

      EDAM_MESSAGE_ATTACHMENTS_MAX = 100

      EDAM_MESSAGE_ATTACHMENT_TITLE_LEN_MAX = 255

      EDAM_MESSAGE_ATTACHMENT_TITLE_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,253}[^\\p{Cc}\\p{Z}])?$"

      EDAM_MESSAGE_ATTACHMENT_SNIPPET_LEN_MAX = 2048

      EDAM_MESSAGE_ATTACHMENT_SNIPPET_REGEX = %q"^[^\\p{Cc}\\p{Z}]([\\n[^\\p{Cc}\\p{Zl}\\p{Zp}]]{0,2046}[^\\p{Cc}\\p{Z}])?$"

      EDAM_USER_PROFILE_PHOTO_MAX_BYTES = 716800

      EDAM_PROMOTION_ID_LEN_MAX = 32

      EDAM_PROMOTION_ID_REGEX = %q"^[A-Za-z0-9_.-]{1,32}$"

      EDAM_APP_RATING_MIN = 1

      EDAM_APP_RATING_MAX = 5

      EDAM_SNIPPETS_NOTES_MAX = 24

      EDAM_CONNECTED_IDENTITY_REQUEST_MAX = 100

    end
  end
end
