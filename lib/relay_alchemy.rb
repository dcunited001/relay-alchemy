module RelayAlchemy 

  module TextSentimentAnalysis
    
    def self.defaults
      { 'outputMode' => 'json',
        'url' => '',
        'showSourceText' => 1.to_s }
    end

    def self.build_params(p = {})
      defaults.merge('text' => p['text'], 'url' => p['url']).symbolize_keys
    end

  end

end
 
# Response Format (JSON):

#       {
#     "status": "REQUEST_STATUS",
#     "url": "REQUESTED_URL",
#     "language": "DOCUMENT_LANGUAGE",
#     "text": "DOCUMENT_TEXT",
#       "docSentiment": {
#         "type": "SENTIMENT_LABEL",
#         "score": "DOCUMENT_SENTIMENT",
#         "mixed": "SENTIMENT_MIXED"
#       }
#     }
