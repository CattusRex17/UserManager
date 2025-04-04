UserManagerUserManager es una aplicación iOS desarrollada en Swift y SwiftUI que permite la gestión de usuarios. Su objetivo principal es consumir datos desde una API, almacenarlos localmente con Realm y permitir crear, editar y eliminar usuarios de manera local.


Características Sincronización inicial desde API pública.

Persistencia local con Realm.
Creación de nuevos usuarios desde el dispositivo.
 Edición de nombre y correo electrónico.
Eliminación lógica de usuarios (local).
Captura de ubicación del usuario usando Core Location.
Internacionalización (i18n) mediante Localizable.strings en español e inglés.


ArquitecturaEl proyecto utiliza una arquitectura basada en MVVM y divide la estructura en carpetas específicas por capas:

Models: Modelos planos (User, Address) y persistentes (UserObject, AddressObject).
Services: Servicios como el consumo de la API (UserService).
Repositories: Encapsulan la lógica de acceso a Realm (UserRepository).
ViewModels: Lógica de presentación (UserListViewModel, CreateUserViewModel, UserDetailViewModel).
Views: Interfaz en SwiftUI.
Extensions: Helpers para localización y otros usos (String+Localized.swift).


Librerías utilizadas

RealmSwift – Para almacenamiento local.
Alamofire – Para consumo de la API REST.


Funcionalidades técnicas

API: Se consume https://jsonplaceholder.typicode.com/users y se transforma cada User en un UserObject.
Se evita sobrescribir usuarios ya creados manualmente localmente.
Realm: Todos los usuarios (API y locales) se almacenan en Realm.
Se utiliza @Persisted y claves primarias para actualización.
Se manejan correctamente los hilos mediante DispatchQueue.main.async para evitar errores de acceso a Realm desde hilos incorrectos.
LocalizaciónSe implementó soporte para español e inglés.
Se utilizan claves Localizable.strings y una extensión String.localized para facilitar la integración en toda la interfaz.
UIAplicación construida 100% en SwiftUI.


Cómo correr el proyectoClona el repositorio:

git clone https://github.com/tu_usuario/UserManager.git

Abre el archivo .xcworkspace en Xcode.

Asegúrate de instalar los Pods si usas CocoaPods:

pod install

Corre el proyecto en un simulador con iOS 15+
