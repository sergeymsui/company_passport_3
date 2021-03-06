
\c dtest;


INSERT INTO public.app_spr_forms(id, name)
    VALUES ('51a5850f-0f42-4c25-8b25-814c585e4495', 'Общие сведения о субъекте деятельности в сфере промышленности'),
           ('9f6a1fe2-1317-46a1-b1b8-c05595099021', 'Основные финансовые показатели'),
           ('2d450370-322e-45f3-9927-8ff9ff96d18d', 'Сведения о персонале'),
           ('4cecb5d6-7da5-4f36-b022-ea77ef07a804', 'Сведения о получении государственной поддержки'),
           ('b49a7444-df79-4b7a-90ec-2c98f4a18dfd', 'Сведения о структуре долговых обязательств'),
           ('00900477-d654-4e62-b78f-3223029981e4', 'Сведения о финансовых вложениях и дебиторской задолженности'),
           ('0fcc4ee8-b578-4900-91f0-29ffae7d004d', 'Сведения о структуре собственности субъекта деятельности в сфере промышленности'),
           ('9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', 'Сведения о прогнозных и фактических объемах производства товаров, работ, услуг, и характеристиках промышленной продукции'),
           ('ac362bc4-8845-4662-8e70-94dcf53aff42', 'Сведения о прогнозе импорта промышленной продукции, фактическом импорте и характеристиках промышленной продукции'),
           ('f53721d5-c326-41b8-aaba-27dd57c7ec66', 'Сведения о потреблении ресурсов, энергосбережении, охране окружающей среды, использовании ресурсосберегающих технологий и возобновляемых источников энергии'),
           ('b33294ed-05ef-4443-9767-2cc9385b3214', 'Сведения о реализации проектов с использованием государственной поддержки'),
           ('fc06f157-d86b-4dec-997b-5f0f8cabca67', 'Список приложений к паспорту');

-- Завершена
INSERT INTO public.app_spr_chapters(id, id_forms_id, number_f, name)
            -- Общие сведения о субъекте деятельности в сфере промышленности
    VALUES ('99d5b67b-57e0-4aa0-a07c-29c997a280b7', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/1', 'Адресно-справочная информация об организации'),
           ('aa56e8ca-fbca-4824-88a1-4022a29dfd80', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/2', 'Сведения о филиалах и обособленных производственных подразделениях'),
           ('7e38acf2-cbfb-49f4-b96a-f5c821570dd3', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/3', 'Ситуационный план'),
           ('a9b57109-5221-4346-8dee-d6acc94472b1', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/4', 'Схема генерального плана'),
           ('4cdcfe90-d268-43a7-a90a-1386cc77caec', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/5', 'Организационно-структурная схема организации (схема управления)'),
           ('fd3bb642-8fcb-4a1b-8d68-0010cad89e1a', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/6', 'Сведения о сертификатах соответствия(заключениях)'),
            --
           ('e3906981-2e13-4c35-a5f8-fd65d3211f31', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/7', 'Сведения о корпоративном строительстве'),
           ('bc1df445-4102-49d5-8f3f-947db9299e5e', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/8', 'Сведения об  имущественных правах акционеров (участников) организации (холдинга)'),
           ('0c26f59b-b400-4048-a339-4cc1a806680d', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/9', 'Сведения об участии в других организациях'),
           ('f223f2a3-fbd1-4a45-bf12-8614423888ab', '51a5850f-0f42-4c25-8b25-814c585e4495', '1/10', 'Сведения о совете директоров общества'),
            -- Основные финансовые показатели
           ('00676b2f-656b-4caf-816e-10a8ac60fc69', '9f6a1fe2-1317-46a1-b1b8-c05595099021', '2/1', 'Бюджет доходов и расходов'),
           ('c87ebf37-b77d-4488-9cde-59532ab21f25', '9f6a1fe2-1317-46a1-b1b8-c05595099021', '2/2', 'Сведения о начисленных и уплаченных налогах, сборах и страховых взносах'),
           ('47244bef-cc54-4859-b570-cd620ba809ed', '9f6a1fe2-1317-46a1-b1b8-c05595099021', '2/7', 'Финансовые результаты процессов коммерциализации объектов интеллектуальной собственности и трансфера технологий (внутренний рынок)'),
           ('958fb490-bff4-453f-9760-985eb9a08cbf', '9f6a1fe2-1317-46a1-b1b8-c05595099021', '2/8', 'Финансовые результаты процессов коммерциализации объектов интеллектуальной собственности и трансфера технологий (экспорт-импорт)'),
            -- Сведения о персонале
           ('20e2cb4e-d040-49e7-b472-57eca5accc9c', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/1', 'Структура численности персонала и оплата труда'),
           ('cf9de446-49dc-4aec-ac1a-dd040f8fb826', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/2', 'Справка-объективка на руководящий состав предприятия'),
           ('eb47f3a1-2ca3-4e48-befa-cb89f45deabf', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/3', 'Сведения о повышении квалификации и переподготовке руководителей и служащих'),
           ('626a5419-9fda-495e-95ac-f54d20463b85', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/4', 'Сведения о профессиональном обучении рабочих'),
           ('b818037a-fad4-45d2-9f58-e9544c8393ee', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/5', 'Востребованность должностей и специальностей персонала предприятияв части квалифицированных рабочих предприятия по состоянию на конец отчетного периода'),
           ('df17a318-188f-48fa-8def-ea98e75eb49b', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/6', 'Востребованность должностей и специальностей персонала предприятия в части персонала со средним профессиональным образованием предприятия по состоянию на конец отчетного периода'),
           ('e9e0537a-d5fc-4239-8f75-258e80042e97', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/7', 'Востребованность должностей и специальностей персонала предприятия в части специалистов с высшим образованием по состоянию на конец отчетного периода'),
           ('74d34ea0-f9aa-4eee-a988-8a9f8408e7db', '2d450370-322e-45f3-9927-8ff9ff96d18d', '5/8', 'Сведения об условиях труда'),
            -- Сведения о получении государственной поддержки
           ('f4a9a3d3-4f29-4cc6-a751-a8b0104f205d', '4cecb5d6-7da5-4f36-b022-ea77ef07a804', '6/27', 'Сведения о субсидиях и бюджетных средствах'),
            -- Сведения о структуре долговых обязательств
           ('51dc50f1-d604-4c02-accc-cf1f5f7280ad', 'b49a7444-df79-4b7a-90ec-2c98f4a18dfd', '8/1', 'Сведения о кредиторской задолженности'),
            -- Сведения о финансовых вложениях и дебиторской задолженности
           ('9a7b8845-7b15-409c-be19-3d777895e3eb', '00900477-d654-4e62-b78f-3223029981e4', '9/1', 'Информация о долгосрочных финансовых вложениях предприятия в другие организации'),
           ('19a10302-978b-4f95-a3c3-1a50ab06698a', '00900477-d654-4e62-b78f-3223029981e4', '9/2', 'Сведения о дебиторской задолженности'),
            -- Сведения о структуре собственности субъекта деятельности в сфере промышленности
           ('09c64c4f-8577-47d9-9253-2a4573d02bcb', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/1-H', 'Сводные сведения об объектах недвижимости'),
           ('eba683a5-1e1d-41eb-a965-78d7320036ed', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/2-H', 'Сведения о земельных участках'),
           ('036cd5e5-d0b6-4665-a92b-53374b961e62', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/3-H', 'Общие сведения о зданиях и сооружениях, находящихся на балансе организации'),
           ('1b9b4b46-1c81-46cd-8a11-99b71cfe4bc8', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/4-H', 'Сведения об объектах социальной сферы, находящихся на балансе'),
           ('c421ecae-9f41-4bbb-90c6-06748b5d55be', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/5-H', 'Сведения об объектах незавершенного строительства'),
           ('28f35ba8-5d56-4267-92bf-adbe0456084d', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/6-H', 'Сведения о сдаче и получении в аренду объектов недвижимости в отчетном году'),
           ('f41e72c0-40e4-480a-8e1c-ea215c8153bb', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/7-H', 'Сведения об объектах недвижимости, отчужденных в отчетном году и планируемых к отчуждению в следующем за отчетным годом'),
           ('692857c8-73be-4d95-807b-223907d2a3ba', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/8-H', 'Сведения о снесенных (ликвидированных) объектах недвижимости в отчетном году и планируемых к сносу в следующем за отчетным годом'),

           ('91878e2b-a512-4f52-bd84-5fb7f76b3c63', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/10-П', 'Производственные основные фонды - возрастной состав оборудования'),
           ('03c84eab-1f98-4f42-a43f-2ce4c194e775', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/11-П', 'Кодифицированный перечень подразделений по видам производства'),
           ('de4aefcc-f38d-4835-8790-177d38503870', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/12-П', 'Состав оборудования по видам производства'),
           ('681ee52b-85e6-4336-b5cc-0311421b9ad0', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/13-П', 'Перечень оборудования предприятия по видам производств'),
           ('b4f62d8b-0c02-4603-bc62-89d011e19c8c', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/14-П', 'Сведения об оборудовании, сданном в аренду'),
           ('3e0586cd-0cea-4bc0-b217-1500e488c949', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/15-П', 'Сведения о собственных затратах на погашение рекламаций за отчетный год'),
           ('97d8d3aa-717f-42e6-aea6-83a29a1db8d8', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/16-П', 'Сведения об оборудовании, реализованном и списанном (утилизированном) в отчетном году и планируемом к реализации и списанию (утилизации) в следующем за отчетным году'),
           ('09912b64-d81d-44ef-893f-534e373401d8', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/17-П', 'Сводные сведения о стендово-испытательной базе  '),

           ('5758d9c2-5831-44fe-b70e-20166889d9c2', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/21-И', 'Сведения о полученных охранных документах и поданных заявках на объекты интеллектуальной собственности в отчетном году'),
           ('2f315d64-22e5-4d7b-8f61-aa619835e680', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/22-И', 'Введение объектов интеллектуальной собственности (ОИС) в хозяйственный и гражданско-правовой оборот '),
           ('0c9e0a2c-55e0-40f3-a570-ef7146e3c00c', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/23-И', 'Сведения об использовании ОИС в собственном производстве в отчетном году'),
           ('272a3dce-df74-48b6-b849-4d445ceafc8b', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/24-И', 'Сведения об учтенных в составе нематериальных активов объектах интеллектуальной собственности'),
           ('76e21eb2-6127-4bdd-9640-96a9236a1bba', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/25-И', 'Автоматизированные системы организации (сводный перечень)'),
           ('5039c246-3fd4-4a9e-9287-99b89ceeec6b', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/26-И', 'Автоматизированные системы организации (характеристики)'),
           ('0ca35634-32e9-4ed3-99c5-8e7aff430b4d', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/27-И', 'Создание и внедрение автоматизированных систем'),
           ('3d774ffe-1989-4181-b90f-b10452fbe201', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/28-И', 'Действующие регламенты информационного взаимодействия'),
           ('089ecdca-53cf-455b-876b-875f16b0d83f', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/29-И', 'Информационные ресурсы организации'),

           ('3ebe36a4-0d45-4602-9a1f-1f8628a9b34f', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/30-П', 'Сведения об арендованном (лизинговом) и полученном на ответственное хранение оборудовании в отчетном году'),
           ('a628070c-3a2d-4d0f-b97a-f144651c1d07', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/31-П', 'Сведения о приобретенном оборудовании в отчетном году'),
           ('1e01951e-0af0-46aa-b8f9-8dd90e9dc972', '0fcc4ee8-b578-4900-91f0-29ffae7d004d', '10/32-П', 'Сведения об оборудовании, запланированном к закупке'),
            -- Сведения о прогнозных и фактических объемах производства товаров, работ, услуг, и характеристиках промышленной продукции
           ('e0f684dc-5df5-4c6f-bdb4-807bc2afec07', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/1', 'Отчет о ходе выполнения и финансирования поставок продукции военного и специального назначения (работ, услуг) на внутренний рынок'),
           ('67bab06f-2229-48b1-9cfe-e862d5484f0e', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/2', 'Отчет о ходе выполнения и финансирования поставок продукции военного назначения (работ, услуг) на экспорт (по ВТС)'),
           ('2a25aa22-7a0a-4cd8-8f5a-926114e143fd', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/3', 'Отчет о ходе выполнения и финансирования НИОКР по спецпродукции'),
           ('ca6e85ea-6e16-4b72-b5e8-b583ada3c51e', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/4', 'Планируемые НИОКР по спецпродукции'),
           ('6ae7b970-c9a5-4aad-9dcc-7530e7dccc4a', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/5', 'Производство продукции гражданского назначения, товаров народного потребления и услуг, оказанных предприятием'),
           ('09472ade-1430-4b44-85c4-4712dec0cf3d', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/6', 'Инновационные проекты по продукции гражданского и двойного назначения'),
           ('73d63ffe-b250-4d38-976c-65660e3a3510', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/11', 'Контракты и соглашения по внешнеэкономическому сотрудничеству с зарубежными странами'),
           ('850b3ce3-43d0-43a4-9cb2-ddb9cbfadc3e', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/12', 'Общие объемы экспорта продукции и услуг предприятия'),
           ('ea9d40c3-efef-4c98-b197-93482057d1f2', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/13', 'Продукция гражданского назначения поставляемая на экспорт'),
           ('7b019d7e-b62b-4ac7-8bf1-8823ed48c0ae', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/14', 'Отчёт о результатах анализа деятельности предприятия в области качества'),
           ('f2c67cae-5a97-4e4c-bba0-131d44267973', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/15', 'Сведения о собственных затратах на погашение рекламаций за отчетный год'),
           ('89bfd418-02fe-42c5-a1a2-b3bb427d3a32', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/16', 'Баланс производственной мощности за отчетный год'),
           ('36b7eb55-ddf4-4701-aff1-46f68e566f04', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/17', 'Трудоёмкость годовой программы товарного выпуска по видам производств и использование технологических мощностей предприятия'),
           ('787bc895-db50-43ed-9ad8-cb08dacc53dd', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/18', 'Сведения об использовании драгоценных и редкоземельных металлов в производственных процессах за отчетный год'),
           ('75864d30-9d60-4294-9b58-a3edda159827', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/19', 'Продукция отечественных производителей, закупаемая в обеспечение выполнения государственых контрактов (контрактов)'),
           ('c71b061c-2c1c-4835-8020-90999d1e0300', '9cd29d7a-7af3-4abc-8409-d6ec2bd615ee', '11/33', 'Отчет об использовании базовых и критических промышленных технологий'),
            -- Сведения о прогнозе импорта промышленной продукции, фактическом импорте и характеристиках промышленной продукции
           ('a8e9ae25-4c22-4ac3-bfb3-89c4c76a498f', 'ac362bc4-8845-4662-8e70-94dcf53aff42', '12/1', 'Общие объемы импорта продукции'),
           ('62588b9d-236a-4a9b-bdd6-d463a64f74f2', 'ac362bc4-8845-4662-8e70-94dcf53aff42', '12/2', 'Сведения об импортируемой продукции'),
           ('7a3e046d-72f1-4cc7-9b29-d07c7424a6ca', 'ac362bc4-8845-4662-8e70-94dcf53aff42', '12/3', 'Продукция, импортируемая в обеспечение выполнения государственных контрактов (контрактов)'),
           ('4e641115-7188-4a64-8f5f-cec50ca5fd0d', 'ac362bc4-8845-4662-8e70-94dcf53aff42', '12/4', 'Сведения о продукции (материалах и комплектующих), используемой при выполнении государственных контрактов (контрактов), производство которой прекращено (приостановлено) или находится за пределами Российской Федерации и импорт которой ограничен'),
            -- Сведения о потреблении ресурсов, энергосбережении, охране окружающей среды, использовании ресурсосберегающих технологий и возобновляемых источников энергии
           ('c311df27-32d1-4d1e-a26b-b18ad8e6ea1c', 'f53721d5-c326-41b8-aaba-27dd57c7ec66', '13/1', 'Сведения о расходах (размерах оплаты) ресурсов по видам'),
           ('15d2049e-866e-4146-b865-cb6b9380bd60', 'f53721d5-c326-41b8-aaba-27dd57c7ec66', '13/2', 'Водопотребление и водоотведение за отчетный год'),
           ('60d5f0f3-ed04-408b-8fd1-6dc2db771b45', 'f53721d5-c326-41b8-aaba-27dd57c7ec66', '13/3', 'Мероприятия по энергосбережению и охране окружающей среды'),
            --  Сведения о реализации проектов с использованием государственной поддержки
           ('ae774bbe-7534-4530-97e5-1a250d2bd76d', 'b33294ed-05ef-4443-9767-2cc9385b3214', '14/1', 'Сведения об участии в реализации государственных и федеральных целевых программ'),
            -- Список приложений к паспорту
           ('146c63fd-026c-4499-8b96-636e6913c900', 'fc06f157-d86b-4dec-997b-5f0f8cabca67', '""', '""');





INSERT INTO public.app_files(id, name, id_chapter_id)
VALUES ('6f6f0ae8-abb9-4436-b0ab-542de3cc19be', '04 Раздел 1.xlsx', '99d5b67b-57e0-4aa0-a07c-29c997a280b7'),
       ('5b61f204-e5ed-40ca-9201-dc6d6b211f01', '04 Раздел 1.xlsx', 'aa56e8ca-fbca-4824-88a1-4022a29dfd80'),
       ('4678de45-7b3f-49ca-938b-987841b55a41', '04 Раздел 1.xlsx', '7e38acf2-cbfb-49f4-b96a-f5c821570dd3'),
       ('d833a01a-f12a-426f-a255-0c0881a5cd3a', '04 Раздел 1.xlsx', 'a9b57109-5221-4346-8dee-d6acc94472b1'),
       ('569b2719-fba8-4186-92a2-8a7be3c8252f', '04 Раздел 1.xlsx', '4cdcfe90-d268-43a7-a90a-1386cc77caec'),
       ('055c9866-3797-41d2-a53a-e3230c5f3c93', '04 Раздел 1.xlsx', 'fd3bb642-8fcb-4a1b-8d68-0010cad89e1a'),
       ('d8991144-800c-41d7-8ce1-3c4f17c27409', '04 Раздел 1.xlsx', 'e3906981-2e13-4c35-a5f8-fd65d3211f31'),
       ('ab40feba-4af4-4b6c-b624-67dbabc983c9', '04 Раздел 1.xlsx', 'bc1df445-4102-49d5-8f3f-947db9299e5e'),
       ('d72466e3-2494-4cd3-b74d-0222cc0d2ee1', '04 Раздел 1.xlsx', '0c26f59b-b400-4048-a339-4cc1a806680d'),
       ('1061450e-f9d9-4071-a067-9e36b2efa224', '04 Раздел 1.xlsx', 'f223f2a3-fbd1-4a45-bf12-8614423888ab');

INSERT INTO public.app_files(id, name, id_chapter_id)
VALUES ('1308ab35-b0b7-4d7b-839f-8a7b1c300adf', '05 Раздел 2.xlsx', '00676b2f-656b-4caf-816e-10a8ac60fc69'),
       ('76e5c548-26ef-473c-b9a6-89d0033f7e23', '05 Раздел 2.xlsx', 'c87ebf37-b77d-4488-9cde-59532ab21f25'),
       ('6e41da9d-1e48-4e36-a688-cf6051b006b6', '05 Раздел 2.xlsx', '47244bef-cc54-4859-b570-cd620ba809ed'),
       ('984461dd-19e3-4287-a328-7edfd44b0056', '05 Раздел 2.xlsx', '958fb490-bff4-453f-9760-985eb9a08cbf');

-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('05100cd1-6789-40d4-962e-15aac8337b2c', '06 Раздел 5.xlsx', '20e2cb4e-d040-49e7-b472-57eca5accc9c'),
--        ('f0c1efb2-ab4d-4750-adf6-12705b7cfffa', '06 Раздел 5.xlsx', 'cf9de446-49dc-4aec-ac1a-dd040f8fb826'),
--        ('bf7e21c2-baf1-44a5-b9a8-b3c90ca02067', '06 Раздел 5.xlsx', 'eb47f3a1-2ca3-4e48-befa-cb89f45deabf'),
--        ('14a10fb1-8c7e-4414-b90c-c20f7e81c7bd', '06 Раздел 5.xlsx', '626a5419-9fda-495e-95ac-f54d20463b85'),
--        ('7e4232c3-6991-4963-ab8c-696c7b4c3d17', '06 Раздел 5.xlsx', 'b818037a-fad4-45d2-9f58-e9544c8393ee'),
--        ('372beeda-fd13-435d-a0c0-4b2d244577d2', '06 Раздел 5.xlsx', 'df17a318-188f-48fa-8def-ea98e75eb49b'),
--        ('9151dcdf-9949-421f-ba8b-c0b6c63e3c7c', '06 Раздел 5.xlsx', 'e9e0537a-d5fc-4239-8f75-258e80042e97'),
--        ('b76c82bf-6353-4bc2-8783-17cdd4aeecb4', '06 Раздел 5.xlsx', '74d34ea0-f9aa-4eee-a988-8a9f8408e7db');
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('a36e5a10-c4f6-4e77-828e-e9d7a97bd154', '07 Раздел 6.xlsx', 'f4a9a3d3-4f29-4cc6-a751-a8b0104f205d');
--
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('3e7d6195-93ad-4b28-b9f3-09693c0cee27', '08 Раздел 8.xlsx', '51dc50f1-d604-4c02-accc-cf1f5f7280ad');
--
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('097198a9-637a-4b56-b421-77dad0d6be09', '09 Раздел 9.xlsx', '9a7b8845-7b15-409c-be19-3d777895e3eb'),
--        ('f231cb7a-84d4-49a0-a11b-a43faffd0355', '09 Раздел 9.xlsx', '19a10302-978b-4f95-a3c3-1a50ab06698a');
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('6eca975e-14ff-4a47-83ff-a83f2733e4b0', '10 Раздел 10 Недвижимость.xlsx', '09c64c4f-8577-47d9-9253-2a4573d02bcb'),
--        ('8b957c2d-9d77-4ce0-b834-47e359d88ac8', '10 Раздел 10 Недвижимость.xlsx', 'eba683a5-1e1d-41eb-a965-78d7320036ed'),
--        ('752d958e-6681-4c4b-9234-f06b9dd48ebd', '10 Раздел 10 Недвижимость.xlsx', '036cd5e5-d0b6-4665-a92b-53374b961e62'),
--        ('42e9eb6c-54f9-4955-bca4-eeb28ab1d749', '10 Раздел 10 Недвижимость.xlsx', '1b9b4b46-1c81-46cd-8a11-99b71cfe4bc8'),
--        ('ce35e35d-800d-4493-9a07-f7a5814e5f28', '10 Раздел 10 Недвижимость.xlsx', 'c421ecae-9f41-4bbb-90c6-06748b5d55be'),
--        ('d309b33b-5278-40b7-9a8c-48cbe0188159', '10 Раздел 10 Недвижимость.xlsx', '28f35ba8-5d56-4267-92bf-adbe0456084d'),
--        ('d9e6d674-fae4-4f98-8599-b852c96c1446', '10 Раздел 10 Недвижимость.xlsx', 'f41e72c0-40e4-480a-8e1c-ea215c8153bb'),
--        ('1ef72168-61f6-44b5-846d-3a0a31b9dcf0', '10 Раздел 10 Недвижимость.xlsx', '692857c8-73be-4d95-807b-223907d2a3ba');
--
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('5d7f7bd6-845c-4c9a-8cd1-2c1102a2a1d7', '10 Раздел 10_Производство.xlsx', '91878e2b-a512-4f52-bd84-5fb7f76b3c63'),
--        ('0f4f3941-57b5-49d3-ac47-2ff846fd710c', '10 Раздел 10_Производство.xlsx', '03c84eab-1f98-4f42-a43f-2ce4c194e775'),
--        ('5253fc46-d23c-4bf8-8509-40fb79922ed1', '10 Раздел 10_Производство.xlsx', 'de4aefcc-f38d-4835-8790-177d38503870'),
--        ('1cea217c-8191-4128-9828-0986bd546190', '10 Раздел 10_Производство.xlsx', '681ee52b-85e6-4336-b5cc-0311421b9ad0'),
--        ('83100149-6fee-4f24-8c3f-ccf6c9bbf1e6', '10 Раздел 10_Производство.xlsx', 'b4f62d8b-0c02-4603-bc62-89d011e19c8c'),
--        ('b3930fd0-98ad-4708-be35-e75d08a4f3fb', '10 Раздел 10_Производство.xlsx', '3e0586cd-0cea-4bc0-b217-1500e488c949'),
--        ('38265f79-4a2c-4237-902a-0ec108cee8f8', '10 Раздел 10_Производство.xlsx', '97d8d3aa-717f-42e6-aea6-83a29a1db8d8'),
--        ('8f9dba6e-6f1c-43f2-bfc7-01dc1b794b67', '10 Раздел 10_Производство.xlsx', '09912b64-d81d-44ef-893f-534e373401d8');
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('03ad3d70-376d-4ca9-8177-e5d0007e2f12', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '5758d9c2-5831-44fe-b70e-20166889d9c2'),
--        ('1d7194cd-bff3-45b0-b3f5-47ea3d552634', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '2f315d64-22e5-4d7b-8f61-aa619835e680'),
--        ('261edf4f-865b-4d6d-b370-1f49ab28b66c', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '0c9e0a2c-55e0-40f3-a570-ef7146e3c00c'),
--        ('8312fe70-d961-4bf1-9446-3a4bfad3fc9c', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '272a3dce-df74-48b6-b849-4d445ceafc8b'),
--        ('7479e392-4004-436a-8927-952887094212', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '76e21eb2-6127-4bdd-9640-96a9236a1bba'),
--        ('30ddd2b6-04a9-4d36-9439-96d26489476a', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '5039c246-3fd4-4a9e-9287-99b89ceeec6b'),
--        ('d3b42a5f-f296-4ee8-b727-cd619d01a7f5', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '0ca35634-32e9-4ed3-99c5-8e7aff430b4d'),
--        ('a5e8d8ba-a779-41b9-9396-689f510a912f', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '3d774ffe-1989-4181-b90f-b10452fbe201'),
--        ('069983a9-ddd0-4973-b1de-79b7763dae8a', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '089ecdca-53cf-455b-876b-875f16b0d83f'),
--        ('1562f581-fcbe-48df-8abe-ec2c888107bf', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '3ebe36a4-0d45-4602-9a1f-1f8628a9b34f'),
--        ('511631a0-2ab7-4157-8115-8c84ab22670e', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', 'a628070c-3a2d-4d0f-b97a-f144651c1d07'),
--        ('adb88107-cfcf-4e6c-822a-c501f987b06f', '10 Раздел 10_Интеллектуальная собс-ть.xlsx', '1e01951e-0af0-46aa-b8f9-8dd90e9dc972');
--
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('ee3b271a-895c-42fd-8d4f-77211ea3d818', '11 Раздел 11.xlsx', 'e0f684dc-5df5-4c6f-bdb4-807bc2afec07'),
--        ('ba395e58-d2e2-4aa3-addb-482e329dc4dc', '11 Раздел 11.xlsx', '67bab06f-2229-48b1-9cfe-e862d5484f0e'),
--        ('98378e3e-9e80-4356-8790-933492ab309a', '11 Раздел 11.xlsx', '2a25aa22-7a0a-4cd8-8f5a-926114e143fd'),
--        ('d23fe6d6-8bbd-4a22-9d7b-c3cddf0e2d82', '11 Раздел 11.xlsx', 'ca6e85ea-6e16-4b72-b5e8-b583ada3c51e'),
--        ('46683936-5d1e-4fab-b646-6061996ebc98', '11 Раздел 11.xlsx', '6ae7b970-c9a5-4aad-9dcc-7530e7dccc4a'),
--        ('cc7b397b-ac11-4bc8-9a64-26acc512980a', '11 Раздел 11.xlsx', '09472ade-1430-4b44-85c4-4712dec0cf3d'),
--        ('dafdd3f1-1f07-4268-b55b-84441694747e', '11 Раздел 11.xlsx', '73d63ffe-b250-4d38-976c-65660e3a3510'),
--        ('d2e16363-8050-461a-bf2c-a364ca8ba0e4', '11 Раздел 11.xlsx', '850b3ce3-43d0-43a4-9cb2-ddb9cbfadc3e'),
--        ('d6ef8f8b-e088-4435-a406-a26da05875cd', '11 Раздел 11.xlsx', 'ea9d40c3-efef-4c98-b197-93482057d1f2'),
--        ('9ce275da-bd39-4378-a324-a0ca3ae92aae', '11 Раздел 11.xlsx', '7b019d7e-b62b-4ac7-8bf1-8823ed48c0ae'),
--        ('0d6f6e8b-8848-4b8b-8052-ed8d5a39b996', '11 Раздел 11.xlsx', 'f2c67cae-5a97-4e4c-bba0-131d44267973'),
--        ('c8af70a2-cf96-402c-8028-114f661ddfd8', '11 Раздел 11.xlsx', '89bfd418-02fe-42c5-a1a2-b3bb427d3a32'),
--        ('c01f39ae-69a6-4ca5-aff7-72ed10f4e828', '11 Раздел 11.xlsx', '36b7eb55-ddf4-4701-aff1-46f68e566f04'),
--        ('22455c17-3bb6-44d7-acdf-d002954e04ca', '11 Раздел 11.xlsx', '787bc895-db50-43ed-9ad8-cb08dacc53dd'),
--        ('ba5d2823-cf04-49f2-9166-d2f816dc173f', '11 Раздел 11.xlsx', '75864d30-9d60-4294-9b58-a3edda159827'),
--        ('882542c3-3ace-4316-8e40-6dc4c400c895', '11 Раздел 11.xlsx', 'c71b061c-2c1c-4835-8020-90999d1e0300');
--
--
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('f3527380-00e8-436b-969e-a721b7898e5b', '12 Раздел 12.xlsx', 'a8e9ae25-4c22-4ac3-bfb3-89c4c76a498f'),
--        ('64386e0d-abd2-41c1-a0ae-2508d841b7cb', '12 Раздел 12.xlsx', '62588b9d-236a-4a9b-bdd6-d463a64f74f2'),
--        ('d7c12b9f-d6fa-4deb-9793-8841987d9211', '12 Раздел 12.xlsx', '7a3e046d-72f1-4cc7-9b29-d07c7424a6ca'),
--        ('2dc98833-afd7-42ba-9af4-667703c97303', '12 Раздел 12.xlsx', '4e641115-7188-4a64-8f5f-cec50ca5fd0d');
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('79a0c48f-c822-42ad-b280-1bca4319b706', '13 Раздел 13.xlsx', 'c311df27-32d1-4d1e-a26b-b18ad8e6ea1c'),
--        ('4648d7cf-94a5-437d-b2c9-baa92ac56783', '13 Раздел 13.xlsx', '15d2049e-866e-4146-b865-cb6b9380bd60'),
--        ('574d612e-f3f1-41be-a7b1-f90574e1b107', '13 Раздел 13.xlsx', '60d5f0f3-ed04-408b-8fd1-6dc2db771b45');
--
-- INSERT INTO public.app_files(id, name, id_chapter_id)
-- VALUES ('472f4e27-af7f-4b8e-b9ce-2a91f3b3171a', '14 Раздел 14.xlsx', 'ae774bbe-7534-4530-97e5-1a250d2bd76d');











--        ('4452ecaa-8313-47ef-8a2e-1b16d6130807', 'Список приложений к паспорту.docx', ''),



