namespace :codebits do
  desc 'Create Codebits Machines'
  task :destroy_machines => :environment do
    Machine.where(:is_codebits => true).destroy_all
  end
  
  desc 'Create Codebits Machines'
  task :create_machines => :environment do 
    Machine.create! do |machine|
      machine.name = "Catia Codebits"
      machine.slug = "catia"
      machine.description = "Located at Codebits"
      machine.icon = "/assets/machines/catia.png"
      machine.is_public = true
      machine.is_codebits = true
    end
    Machine.create! do |machine|
      machine.name = "Monica Codebits"
      machine.slug = "monica"
      machine.description = "Located at Codebits"
      machine.icon = "/assets/machines/monica.png"
      machine.is_public = true
      machine.is_codebits = true
    end
    Machine.create! do |machine|
      machine.name = "Vanessa Codebits"
      machine.slug = "vanessa"
      machine.description = "Located at Codebits"
      machine.icon = "/assets/machines/vanessa.png"
      machine.is_public = true
      machine.is_codebits = true
    end
    Machine.create! do |machine|
      machine.name = "Barbara Codebits"
      machine.slug = "barbara"
      machine.description = "Located at Codebits"
      machine.icon = "/assets/machines/barbara.png"
      machine.is_public = true
      machine.is_codebits = true
    end
    Machine.create! do |machine|
      machine.name = "Teresa Codebits"
      machine.slug = "teresa"
      machine.description = "Located at Codebits"
      machine.icon = "/assets/machines/teresa.png"
      machine.is_public = true
      machine.is_codebits = true
    end
    Machine.create! do |machine|
      machine.name = "Mafalda Codebits"
      machine.slug = "mafalda"
      machine.description = "Located at Codebits"
      machine.icon = "/assets/machines/mafalda.png"
      machine.is_public = true
      machine.is_codebits = true
    end
  end
  
end