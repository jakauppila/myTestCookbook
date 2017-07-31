my_provider '/myfile.txt' do
  contents 'Goodbye World.'
  action [:add, :config]
end
