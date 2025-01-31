import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { unmarshall } from "@aws-sdk/util-dynamodb"; // Правильний імпорт
import { SESClient, SendEmailCommand } from "@aws-sdk/client-ses";

const sesClient = new SESClient({ region: "eu-north-1" });

export const handler = async (event) => {
    console.log("Received event:", JSON.stringify(event, null, 2));

    for (const record of event.Records) {
        try {
            if (record.eventName === "INSERT" || record.eventName === "MODIFY") {
                // Використання unmarshall для перетворення NewImage
                const newImage = unmarshall(record.dynamodb.NewImage);

                const email = "ukrgorban@gmail.com";
                const name = newImage.name;

                let message = `В таблиці User зареєстровано нового користувача ${name}.`;

                if(record.eventName === "MODIFY"){
                    message = `В таблиці User змінилися дані для користувача ${name}.`
                }

                const params = {
                    Destination: {
                        ToAddresses: [email],
                    },
                    Message: {
                        Body: {
                            Text: {
                                Data: message,
                            },
                        },
                        Subject: {
                            Data: "AWS notification",
                        },
                    },
                    Source: email,
                };

                const command = new SendEmailCommand(params);
                const result = await sesClient.send(command);
                console.log("Email sent successfully:", result.MessageId);
            }
        } catch (error) {
            console.error("Error processing record:", error.message, error.stack);
        }
    }

    return {
        statusCode: 200,
        body: JSON.stringify("Обробка завершена"),
    };
};
