<?php
/**
 * File containing the BlockTest class.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 * @version 2014.07.0
 */

namespace eZ\Publish\Core\MVC\Symfony\Matcher\Tests\Block\Id;

use eZ\Publish\Core\MVC\Symfony\Matcher\Block\Id\Block as BlockIdMatcher;
use eZ\Publish\Core\FieldType\Page\Parts\Block;
use PHPUnit_Framework_TestCase;

class BlockTest extends PHPUnit_Framework_TestCase
{
    /**
     * @var \eZ\Publish\Core\MVC\Symfony\Matcher\Block\MatcherInterface
     */
    private $matcher;

    protected function setUp()
    {
        parent::setUp();
        $this->matcher = new BlockIdMatcher;
    }

    /**
     * @dataProvider matchBlockProvider
     *
     * @param $matchingConfig
     * @param \eZ\Publish\Core\FieldType\Page\Parts\Block $block
     * @param $expectedResult
     */
    public function testMatchBlock( $matchingConfig, Block $block, $expectedResult )
    {
        $this->matcher->setMatchingConfig( $matchingConfig );
        $this->assertSame( $expectedResult, $this->matcher->matchBlock( $block ) );
    }

    public function matchBlockProvider()
    {
        return array(
            array(
                123,
                $this->generateBlockForId( 123 ),
                true
            ),
            array(
                123,
                $this->generateBlockForId( 456 ),
                false
            ),
            array(
                array( 123, 789 ),
                $this->generateBlockForId( 456 ),
                false
            ),
            array(
                array( 123, 789 ),
                $this->generateBlockForId( 789 ),
                true
            )
        );
    }

    /**
     * @param $id
     * @return \eZ\Publish\Core\FieldType\Page\Parts\Block
     */
    private function generateBlockForId( $id )
    {
        return new Block(
            array( 'id' => $id )
        );
    }
}
