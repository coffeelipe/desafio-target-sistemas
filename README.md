# Target Challenge (Flutter)

Aplicativo mobile desenvolvido em Flutter como **desafio técnico** (caráter **educacional**) realizado como parte de um **processo seletivo da Target Sistemas**.

O app é uma biblioteca de notas com autenticação, sincronização em nuvem e um painel de estatísticas geradas a partir do conteúdo das notas.

## Funcionalidades

- **Autenticação**
	- Login e cadastro via **Firebase Authentication**
- **Notas**
	- Criar, editar e visualizar notas
	- Exclusão com **janela de desfazer** (undo) por tempo
	- Edição em tela cheia
- **Dashboard (estatísticas)**
	- Totais de notas, linhas, palavras e caracteres
	- Gráficos de composição (letras vs números, caracteres especiais, etc.)
- **Perfil**
	- Atualização de nome de usuário
	- Logout
	- Fluxo de exclusão de conta
- **Sincronização**
	- Persistência e sync das notas no **Cloud Firestore**

## Stack / Tecnologias

- **Flutter** (Dart)
- **Gerenciamento de estado:** MobX + Provider
- **Backend-as-a-Service:** Firebase
	- `firebase_auth`
	- `cloud_firestore`
	- `firebase_core`
- **UI / Utilitários:**
	- `flutter_screenutil` (responsividade)
	- `fl_chart` (gráficos)
	- `flutter_svg` (assets SVG)
	- `remixicon` (ícones)

## Estrutura do projeto (resumo)

- `lib/src/pages/`: telas (login, cadastro, home, dashboard, perfil)
- `lib/src/stores/`: stores MobX (auth, notas, profile, scaffold)
- `lib/src/services/`: integrações (Firestore)
- `lib/src/models/`: modelos (ex.: `Note`)

## Como executar localmente

### Pré-requisitos

- Flutter instalado (compatível com o SDK declarado no `pubspec.yaml`)
- Dispositivo/emulador Android configurado

### Passos

```bash
flutter pub get
flutter run
```

Se você alterar stores MobX (arquivos com `part ...g.dart`), gere novamente os arquivos:

```bash
dart run build_runner build --delete-conflicting-outputs
```

> Observação: o projeto usa Firebase. Para rodar com **seu** projeto Firebase, configure as credenciais (ex.: via FlutterFire CLI) e habilite Authentication + Firestore no console.

## APK

Vou deixar um **APK de release** disponível no repositório para facilitar a demonstração.

- Baixe o arquivo na pasta `apk/` do repositório
- No Android, habilite a permissão de instalação de fontes desconhecidas quando solicitado

## Observações finais

Este projeto foi desenvolvido com foco em aprendizado e demonstração de habilidades (arquitetura simples, UI, estado com MobX e integração com Firebase) dentro do escopo do desafio técnico da **Target Sistemas**.
O código é organizado e comentado para facilitar a compreensão, mas não é otimizado para produção (ex.: tratamento de erros, segurança, testes). O objetivo principal é mostrar a capacidade de construir um app funcional e bem estruturado usando Flutter.
Sinta-se à vontade para explorar o código, rodar o app e testar suas funcionalidades!
Os arquivos de configuração do Firebase (ex.: `google-services.json`) não estão incluídos no repositório por questões de segurança, mas o app pode ser facilmente configurado para usar seu próprio projeto Firebase seguindo a [documentação oficial do FlutterFire](https://firebase.google.com/docs/flutter/setup?platform=android).

Os dados que você inserir no app são armazenados no Firestore, e tratados com privacidade. O acesso é controlado pelo Firebase Authentication, então apenas você (com sua conta) pode ver e editar suas notas. Você pode excluir sua conta a qualquer momento, pelo próprio app, o que apagará todos os seus dados do Firestore. O app é apenas um projeto de demonstração, sem fins comerciais, e não compartilha seus dados com terceiros.

Caso precise de ajuda com a sua conta ou tenha dúvidas sobre o funcionamento do app, entre em contato comigo pelo LinkedIn ou por email. Estou à disposição para esclarecer qualquer questão!

Desenvolvido por Felipe Pontes

fpontes.dev@gmail.com | [LinkedIn](https://www.linkedin.com/in/fpontes-dev/) | [GitHub](https://github.com/coffeelipe)
