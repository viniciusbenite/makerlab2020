from requests_oauthlib import OAuth1Session


def request_token(key, secret, url):
    """
    Returns the token and the secret
    """
    oauth = OAuth1Session(key, client_secret=secret)
    fetch_response = oauth.fetch_request_token(url)

    token = fetch_response.get('oauth_token')
    owner_secret = fetch_response.get('oauth_token_secret')

    return token, owner_secret