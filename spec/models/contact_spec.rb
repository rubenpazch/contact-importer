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
        contact.name = "Carlos\ Paz"
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

    context 'when creating contact validate date of birth' do 
      it '' do 
      end
    end
  end
end
