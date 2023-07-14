import torch
from PIL import Image
import open_clip

model, _, preprocess = open_clip.create_model_and_transforms(
    'ViT-B-32', pretrained='laion2b_s34b_b79k')
tokenizer = open_clip.get_tokenizer('ViT-B-32')

labels = ["photo of vehicle accident", "photo of robbery or assault",
          "Photo of fire or explosion", "Photo of croud formation or gathering of people"]
text = tokenizer(labels)


def image_classifier(inp):
    print(type(inp))
    # image = preprocess(Image.open("accident.jpg")).unsqueeze(0)
    image = preprocess(Image.fromarray(inp)).unsqueeze(0)
    with torch.no_grad(), torch.cuda.amp.autocast():
        image_features = model.encode_image(image)
        text_features = model.encode_text(text)
        image_features /= image_features.norm(dim=-1, keepdim=True)
        text_features /= text_features.norm(dim=-1, keepdim=True)

        text_probs = (100.0 * image_features @ text_features.T).softmax(dim=-1)
        print("Label probs:", text_probs)
        text_probs = text_probs[0]
        print(text_probs[0])

        maxProb = 0
        ansIndex = ""
        for idx, probs in enumerate(text_probs):
            if probs > maxProb:
                ansIndex = idx
                maxProb = probs

        # obj = {}
        # for i in range(len(labels)):
        #     currLabel = labels[i]
        #     currProb = text_probs[i]
        #     obj[currLabel] = currProb
        # print(obj)
        return {labels[ansIndex]: 1}

if __name__ == '__main__':
    import gradio as gr
    image_input = gr.inputs.Image(shape=(224, 224))
    output = gr.outputs.Label()
    demo = gr.Interface(fn=image_classifier, inputs=image_input, outputs=output)
    demo.launch(share=False)
