require("luasnip.session.snippet_collection").clear_snippets("typescript")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescript", {
  s(
    "superapp-controller",
    fmt(
      [[
        import {{ IdResponse }} from '@/libs/api/id.response.dto';
        import {{ ExceptionBase }} from '@/libs/exceptions';
        import {{ Body, Controller }} from '@nestjs/common';
        import {{ CommandBus }} from '@nestjs/cqrs';
        import {{ match, Result }} from 'oxide.ts';
        import {{ matchHttpException }} from '@/libs/exceptions/exception.utils';

        export class {}Controller {{
          constructor(private readonly commandBus: CommandBus) {{}}

          async handler({}) {{
            const command = new {}({{ ...body }});
            const result = await this.commandBus.execute<
              {},
              Result<string, ExceptionBase>
            >(command);

            return match(result, {{
              Ok: (id) => new IdResponse(id),
              Err: (err) => {{
                throw matchHttpException(err);
              }},
            }});
          }}
        }}
      ]],
      {
        i(1, "Example"), -- For the class name
        i(2, "ExampleRequestDto"), -- For the DTO type
        i(3, "ExampleCommand"), -- For the command type
        i(4, "ExampleCommand"), -- For the command type
      }
    )
  ),
})

ls.add_snippets("typescript", {
  s(
    "superapp-service",
    fmt(
      [[
        import {{ ExceptionBase }} from '@/libs/exceptions';
        import {{ Inject }} from '@nestjs/common';
        import {{ CommandHandler, ICommandHandler }} from '@nestjs/cqrs';
        import {{ Ok, Result }} from 'oxide.ts';

        @CommandHandler({})
        export class {}Service
          implements ICommandHandler<{}, Result<any, ExceptionBase>>
        {{
          constructor(
            @Inject({})
            private readonly repository: {},
          ) {{}}

          async execute(
            command: {},
          ): Promise<Result<any, ExceptionBase>> {{
            // TODO: Implement the service logic here
            return Ok('return value');
          }}
        }}
      ]],
      {
        i(1, "Example"), -- For the command type
        i(2, "Example"), -- For the service name
        i(3, "Example"), -- For the command type
        i(4, "Example"), -- For the repository port
        i(5, "Example"), -- For the repository port
        i(6, "Example"), -- For the command type
      }
    )
  ),
})

ls.add_snippets("typescript", {
  s(
    "superapp-command",
    fmt(
      [[
        import {{ Command, CommandProps }} from '@/libs/ddd/command.base';

        export class {}Command extends Command {{
          readonly input!: {};

          constructor(props: CommandProps<{}Command>) {{
            super(props);
            this.input = props.input;
          }}
        }}
      ]],
      {
        i(1, "Example"), -- For the command name
        i(2, "any"), -- For the command name
        i(3, "Example"), -- For the command name
      }
    )
  ),
})

ls.add_snippets("typescript", {
  s(
    "superapp-query",
    fmt(
      [[
        import {{ CommandProps }} from '@/libs/ddd/command.base';

        export class {}Query {{
          readonly input!: {};

          constructor(props: CommandProps<{}Query>) {{
            this.input= props.input;
          }}
        }}
      ]],
      {
        i(1, "Example"), -- For the query name
        i(2, "any"), -- For the query name
        i(3, "Example"), -- For the query name
      }
    )
  ),
})

-- Mapper boilerplate
ls.add_snippets("typescript", {
  s(
    "superapp-mapper",
    fmt(
      [[
        import {{ Mapper }} from '@/libs/ddd/mapper.interface';
        import {{ Injectable }} from '@nestjs/common';

        @Injectable()
        export class {}Mapper implements Mapper<{}, {}, {}> {{
        }}
      ]],
      {
        i(1, "Example"), -- For the mapper name
        i(2, "ExampleEntity"), -- For entity type
        i(3, "ExampleModel"), -- For model type
        i(4, "ExampleResponseDto"), -- For response DTO type
      }
    )
  ),
})

-- Module boilerplate
ls.add_snippets("typescript", {
  s(
    "superapp-module",
    fmt(
      [[
        import {{ Module, Provider }} from '@nestjs/common';

        const httpControllers: any[] = [];

        const repositories: Provider[] = [];

        const commandHandlers: Provider[] = [];

        @Module({{
          providers: [...repositories, ...commandHandlers],
          controllers: [...httpControllers],
        }})
        export class {}Module {{}}
      ]],
      {
        i(1, "Example"), -- For the module name
      }
    )
  ),
})

ls.add_snippets("typescript", {
  s(
    "superapp-repository-port",
    fmt(
      [[
        import {{ MongoDBRepositoryBase }} from '@/libs/db/mongodb-repository.base';

        export type {}RepositoryPort = MongoDBRepositoryBase<{}, {}>;
      ]],
      {
        i(1, "Example"), -- For the repository port name
        i(2, "any"), -- For the entity type
        i(3, "any"), -- For the model type
      }
    )
  ),
})

-- Repository boilerplate
ls.add_snippets("typescript", {
  s(
    "superapp-repository",
    fmt(
      [[
        import {{ MongoDBRepositoryBase }} from '@/libs/db/mongodb-repository.base';
        import {{ Logger }} from '@nestjs/common';
        import {{ EventEmitter2 }} from '@nestjs/event-emitter';
        import {{ InjectConnection }} from '@nestjs/mongoose';
        import mongoose from 'mongoose';

        export class {}Repository
          extends MongoDBRepositoryBase<{}, {}>
          implements {}RepositoryPort
        {{
          collectionName: string = '{}';

          constructor(
            @InjectConnection('db')
            protected readonly db: mongoose.Connection,
            protected readonly mapper: {}Mapper,
            protected readonly eventEmitter: EventEmitter2,
          ) {{
            super(db, mapper, eventEmitter, new Logger({}Repository.name));
          }}
        }}
      ]],
      {
        i(1, "Example"), -- For the repository name
        i(2, "Example"), -- For the entity type
        i(3, "Example"), -- For the model type
        i(4, "Example"), -- For the repository port name
        i(5, "examples"), -- For the collection name
        i(6, "Example"), -- For the mapper name
        i(7, "example"), -- For logger name
      }
    )
  ),
})

-- Entity boilerplate
ls.add_snippets("typescript", {
  s(
    "superapp-entity",
    fmt(
      [[
        import {{ AggregateRoot }} from '@/libs/ddd/aggregate-root.base';
        import * as crypto from 'crypto';

        export class {}Entity extends AggregateRoot<any> {{
          protected _id!: string;

          static create(create: any): {}Entity {{
            const id = crypto.randomUUID();
            const props = {{
              ...create,
            }};
            return new {}Entity({{ id, props }});
          }}

          validate(): void {{
            throw new Error('Method not implemented.');
          }}
        }}
      ]],
      {
        i(1, "Example"), -- For the entity name
        i(2, "Example"), -- For the entity name
        i(3, "Example"), -- For the entity name
      }
    )
  ),
})
