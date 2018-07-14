Babylonia

Goal
-help caregivers provide baby reports regarding baby's activities to their respective moms

#Activity Model
- belongs_to a Baby
- belongs_to a caregiver

- baby_id
- caregiver_id
- activity type
- duration
- notes
- date/time

Report model
- date timestamps
- belongs_to baby
- belongs_to caregiver
- has_many activities


Baby Model
#- has_many report
#- has_many activities through report
- belongs_to mom
- belongs_to caregiver
- name
- DOB
- allergies
- Picture - paperclip gem
- Emergency contact

Mom Model
- has_many :babies
- has_many caregivers through babies


Caregiver model
- has_many babies
- has_many moms through babies

Views
Activity
- index page
- Show page
- Edit page
-
