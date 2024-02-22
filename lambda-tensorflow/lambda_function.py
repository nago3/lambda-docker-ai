"""tensorflowを使ったLambda関数のサンプル"""
import tensorflow as tf

def lambda_handler(event, context):
    # 計算サンプル
    a = tf.constant(3.0)
    b = tf.constant(4.0)
    c = tf.add(a, b)
    result = c.numpy()

    return {
        'statusCode': 200,
        'body': f'Result: {result}'
    }
