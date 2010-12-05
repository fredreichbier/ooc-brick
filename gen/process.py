def process(client):
    # Make `Layer add` return a Layer instance.
    client.codegens['Layer'].get_member_by_name('add').rettype = 'Layer'
