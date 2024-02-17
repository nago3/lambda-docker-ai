import tensorflow as tf

def lambda_handler(event, context):
    # 計算サンプル
    a = tf.constant(3.0)
    b = tf.constant(4.0)
    c = tf.add(a, b)

    # TensorFlowのセッションを開始し、計算結果を取得
    with tf.compat.v1.Session() as session:
        result = session.run(c)

    return {
        'statusCode': 200,
        'body': f'Result: {result}'
    }
