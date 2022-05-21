def create_article
    visit(new_article_path)

    fill_in :article_title, :with => 'Test article title'
    find('trix-editor').set('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed')
    
    click_button('Опубликовать')
end