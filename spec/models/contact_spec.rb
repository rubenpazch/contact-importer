require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'Model Validations' do 
    before(:each) do 
      Contact.delete_all
    end
    context 'when creating contact validate symbols in name' do 
      it 'name with symbol & is invalid' do
        contact = build(:contact)
        contact.name = "Carlos Paz&"        
        expect(contact.valid?).to be false
      end

      it 'name with symbol / is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos Paz/"
        expect(contact.valid?).to be false
      end

      it 'name with symbol + is invalid' do
        contact = build(:contact)        
        contact.name = "+Carlos Paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol * is invalid' do
        contact = build(:contact)        
        contact.name = "*Carlos Paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol _ is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos_Paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol : is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos:Paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol ´ is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos´Paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol $ is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos$Paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol \ is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos\\paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol ~ is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos~ Paz"
        expect(contact.valid?).to be false
      end

      it 'name with symbol ´ is invalid' do
        contact = build(:contact)        
        contact.name = "Carlos´ Paz"
        expect(contact.valid?).to be false
      end

      it "name with symbol ' is invalid" do
        contact = build(:contact)        
        contact.name = "Carlos' Paz"
        expect(contact.valid?).to be false
      end

      it "name with symbol ? is invalid" do
        contact = build(:contact)        
        contact.name = "Carlos? Paz"
        expect(contact.valid?).to be false
      end

      it "name with symbol ¿ is invalid" do
        contact = build(:contact)        
        contact.name = "Carlos ¿ Paz"
        expect(contact.valid?).to be false
      end

      it 'name with minus symbol is valid' do
        contact = build(:contact)        
        contact.name = "Carlos-Paz"
        expect(contact.valid?).to be true
      end
    end

    context 'when fields are required' do 
      it 'name is required' do 
        contact = build(:contact)
        contact.name = nil
        contact.valid?
        expect(contact.valid?).to be false
      end
      it 'date of birth is required' do 
        contact = build(:contact)
        contact.date_of_birth = nil
        contact.valid?
        expect(contact.valid?).to be false
      end
    end


    context 'when creating contact validate date of birth' do 
      it 'date format is invalid' do 
        contact = build(:contact)
        #contact.date_of_birth = "Evil"
        contact.name = "Carlos Paz"
        p contact
        #contact.save
        contact.valid?
        p contact.errors.full_messages
        expect(contact.valid?).to be true
      end
    end
  end
end
