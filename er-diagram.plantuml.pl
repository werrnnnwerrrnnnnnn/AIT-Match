@startuml

hide circle

'----------------------User Table-----------------------------'
entity "Users" {
    * id : bigint (PK)
    * email : string
    * encrypted_password : string
    * reset_password_token : string
    * reset_password_sent_at : timestamp
    * remember_created_at : timestamp
    * role : string
}
'---------------------Profile Table---------------------------'
entity "Profiles" {
    * id : bigint (PK)
    * user_id : bigint (FK to Users)
    * first_name : string
    * last_name : string
    * user_name : string
    * mbti_id : bigint (FK to Mbti)
    * gender_id : bigint (FK to Genders)
    * degree_id : bigint (FK to Degrees)
    * school_id : bigint (FK to Schools)
    * program_id : bigint (FK to Programs)
    * educational_background : text
    * birthday : date
}

entity "active_storage_blobs" {
    * id : bigint (PK)
    * key : string
    * filename : string
    * content_type : string
    * metadata : jsonb
    * byte_size : bigint
    * checksum : string
    * created_at : timestamp
}

entity "active_storage_attachments" {
    * id : bigint (PK)
    * name : string
    * record_type : string
    * record_id : bigint (FK to Profiles)
    * blob_id : bigint (FK to active_storage_blobs)
    * created_at : timestamp
}

Profiles ||--o{ active_storage_attachments : "profile_picture"
active_storage_blobs ||--o{ active_storage_attachments : "blob"

'----------------Preset Tables for Profiles Details------------'
entity "Genders" {
    * id : bigint (PK)
    * value : string
    * label : string
}
entity "Degrees" {
    * id : bigint (PK)
    * value : string
    * label : string
}
entity "Schools" {
    * id : bigint (PK)
    * name : string
    * abbreviation : string
}
entity "Programs" {
    * id : bigint (PK)
    * name : string
    * abbreviation : string
}
entity "Relationships" {
    * id : bigint (PK)
    * name : string
    * description : string
}
entity "Interests" {
    * id : bigint (PK)
    * name : string
}
entity "Mbti" {
    * id : bigint (PK)
    * value : string
    * label : string
}

Users ||-left-|| Profiles
Profiles }o--|| Genders
Profiles }o--|| Degrees
Profiles }o--|| Programs
Profiles }o--|| Schools
Profiles }o--|| Mbti

'----------------Join Table for Profile Details----------------'
entity "Profile_Interests" {
    * profile_id : bigint (FK to Profiles)
    * interest_id : bigint (FK to Interests)
}
entity "Profile_Relationships" {
    * profile_id : bigint (FK to Profiles)
    * relationship_id : bigint (FK to Relationships)
}

Profiles ||--o{ Profile_Interests
Profile_Interests }o--|| Interests

Profiles ||--o{ Profile_Relationships
Profile_Relationships }o--|| Relationships

'---------------------Preference Table------------------------'
entity "Preferences" {
    * id : bigint (PK)
    * user_id : bigint (FK to Users)
    * preferred_min_age : integer
    * preferred_max_age : integer
}

'---------------Preset Tables for Preference-------------------'
entity "PreferredGenders" {
    * id : bigint (PK)
    * value : string
    * label : string
}
entity "PreferredDegrees" {
    * id : bigint (PK)
    * value : string
    * label : string
}
entity "PreferredSchools" {
    * id : bigint (PK)
    * name : string
    * abbreviation : string
}
entity "PreferredPrograms" {
    * id : bigint (PK)
    * name : string
    * abbreviation : string
}
entity "PreferredRelationships" {
    * id : bigint (PK)
    * name : string
    * description : string
}
entity "PreferredInterests" {
    * id : bigint (PK)
    * name : string
}
entity "PreferredMbtis" {
    * id : bigint (PK)
    * value : string
    * label : string
}

'--------------Join Table for Preference Details---------------'
entity "Users_PreferredDegrees" {
    * preference_id : bigint (FK to Users)
    * preferred_degree_id : bigint (FK to PreferredDegrees)
}

entity "Users_PreferredGenders" {
    * user_id : bigint (FK to Users)
    * preferred_gender_id : bigint (FK to PreferredGenders)
}

entity "Users_PreferredInterests" {
    * preference_id : bigint (FK to Users)
    * preferred_interest_id : bigint (FK to PreferredInterests)
}

entity "Users_PreferredMbtis" {
    * preference_id : bigint (FK to Users)
    * preferred_mbti_id : bigint (FK to PreferredMbtis)
}

entity "Users_PreferredPrograms" {
    * preference_id : bigint (FK to Users)
    * preferred_program_id : bigint (FK to PreferredPrograms)
}

entity "Users_PreferredRelationships" {
    * preference_id : bigint (FK to Users)
    * preferred_relationship_id : bigint (FK to PreferredRelationships)
}

entity "Users_PreferredSchools" {
    * preference_id : bigint (FK to Users)
    * preferred_school_id : bigint (FK to PreferredSchools)
}

Users ||--|| Preferences

Preferences ||--o{ Users_PreferredGenders
Users_PreferredGenders }o--|| PreferredGenders

Preferences ||--o{ Users_PreferredDegrees
Users_PreferredDegrees }o--|| PreferredDegrees

Preferences ||--o{ Users_PreferredSchools
Users_PreferredSchools }o--|| PreferredSchools

Preferences ||--o{ Users_PreferredPrograms
Users_PreferredPrograms }o--|| PreferredPrograms

Preferences ||--o{ Users_PreferredRelationships
Users_PreferredRelationships }o--|| PreferredRelationships

Preferences ||--o{ Users_PreferredInterests
Users_PreferredInterests }o--|| PreferredInterests

Preferences ||--o{ Users_PreferredMbtis
Users_PreferredMbtis }o--|| PreferredMbtis

'-----------------------Match Table----------------------------'
entity Matches {
    * id : bigint (PK)
    * requestor_id (FK to Profiles) 
    * receiver_id (FK to Profiles)
    * status : string  
}

Profiles ||-up-o{ Matches : "requestor_id"
Profiles ||-up-o{ Matches : "receiver_id"

'-----------------------Chat Table-----------------------------'
entity "Conversations" {
  * id : bigint (PK)
  * sender_id : bigint (FK to Profiles)
  * receiver_id : bigint (FK to Profiles)
  * match_id : bigint (FK to Matches, optional)
}

entity "Messages" {
  * id : bigint (PK)
  * conversation_id : bigint (FK to Conversations)
  * profile_id : bigint (FK to Profiles)
  * body : text
}

Profiles ||-up-o{ Conversations : "sender_id"
Profiles ||-up-o{ Conversations : "receiver_id"
Conversations ||-up-o{ Messages : "conversation_id"
Profiles ||-up-o{ Messages : "profile_id"

'-----------------------Report Table---------------------------'
entity "Reports" {
    * id : bigint (PK)
    * reporter_profile_id : bigint (FK to Profiles)
    * reported_profile_id : bigint (FK to Profiles) 
    * reason : string
    * status : string
}
Profiles ||-up-o{ Reports : "reporter_profile_id"
Profiles ||-up-o{ Reports : "reported_profile_id"
@enduml