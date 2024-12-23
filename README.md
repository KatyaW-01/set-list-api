# Caching

## Setup
```bash
bundle install
rails db:{drop,create,migrate,seed}
EDITOR="code --wait" rails credentials:edit
```

Set up your credentials .yml file with the following format:
```yml
secret_key_base: ignore_this_1234_qwertyasdfjkl

pexels:
  key: abcd1234_your_key_here

```

Run your tests to ensure tests are green. 

